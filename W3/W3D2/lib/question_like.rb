class QuestionLike < ModelBase
  attr_accessor :user_id, :question_id

  def self.all
    super('question_likes')
  end

  def self.find_by_id(id)
    question_like = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless question_like.length > 0

    QuestionLike.new(question_like.first) # question_like is stored in an array!
  end

  def self.likers_for_question_id(question_id)
    #returns array of user objects
    ids = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        users.id
      FROM
        question_likes
      INNER JOIN
        users ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL
    # if you want nice output
    # ids.map {|set| set.values.join(" ")}

    # returns array of user objects
    ids.map { |id| User.find_by_id(id.values) }
  end

  def self.liked_questions_for_user_id(user_id)
    #returns array of question objects
    ids = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        question_id
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    # returns array of quesiton objects
    ids.map { |id| Question.find_by_id(id.values) }
  end


  def self.num_likes_for_question_id(question_id)
    # fetches n-most followed questions
    QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(question_id) as num_likes
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
  end

  def self.most_liked_questions(n)
    # fetches n-most followed questions
    QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        question_follows
      INNER JOIN
        questions ON questions.id = question_follows.question_id
      GROUP BY question_id
      ORDER BY count(question_id)
      LIMIT n = ?;
    SQL
  end

  def initialize(options)
    super(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @user_id, @question_id)
      INSERT INTO
        question_likes (user_id, question_id)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @user_id, @question_id, @id)
      UPDATE
        question_likes
      SET
        user_id = ?, question_id = ?
      WHERE
        id = ?
    SQL
  end


end
