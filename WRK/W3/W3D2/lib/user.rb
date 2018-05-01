class User < ModelBase
  attr_accessor :fname, :lname

  def self.all
    super('users')
  end

  def self.find_by_id(id)
    user = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first) # user is stored in an array!
  end

  # def self.find_by_name(fname, lname)
  #   users = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
  #     SELECT *
  #     FROM users
  #     WHERE fname = ? AND lname = ?
  #   SQL
  #
  #   return nil if users.empty?
  #
  #   users.map { |user| User.new(user) }
  # end

  def initialize(options)
    super(options)
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
    self
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    # Avgerage number of likes for a user's questions
    # BUT METHODS ARE SO MUCH EASIER.
    question_all_likes = []

    all_questions = authored_questions

    all_questions.each do |question|
      question_all_likes << question.num_likes[0].values
    end

    lng = question_all_likes.length
    total = question_all_likes.reduce(:+)[0]
    return total / lng
  end

  def save
    # if ID != exist, throws errors => call create
    # else call update, if error => oh shit.
    begin
      create
    rescue
      begin
        update
      rescue
        puts "Save error: oh shit."
      end
    end
  end

end # class end
