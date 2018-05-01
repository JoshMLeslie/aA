class Reply < ModelBase

  def self.all
    super('replies')
  end

  def self.find_by_id(id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first) # reply is stored in an array!
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies
      WHERE user_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end
  def self.find_by_question_id(question_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies
      WHERE question_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end


  def initialize(options)
    super(options)
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
    @question_id = options['question_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @parent_id, @user_id, @body, @question_id)
      INSERT INTO
        replies (parent_id, user_id, body, question_id)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @parent_id, @user_id, @body, @question_id, @id)
      UPDATE replies
      SET parent_id = ?, user_id = ?, body = ?, question_id = ?
      WHERE id = ?
    SQL
  end

  def author
    name_array = QuestionsDBConnection.instance.execute(<<-SQL, @user_id)
      SELECT fname, lname
      FROM users
      WHERE users.id = ?
    SQL

    name_array[0].values.join(" ")
  end

  def question
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id)
      SELECT * -- May need to change to title
      FROM questions
      WHERE questions.id = ?
    SQL
  end

  def parent_reply
    QuestionsDBConnection.instance.execute(<<-SQL, @parent_id)
      SELECT *
      FROM replies
      WHERE replies.id = ?
    SQL
  end

  def child_replies
    QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT *
      FROM replies
      WHERE replies.id = ?
    SQL
  end
end
