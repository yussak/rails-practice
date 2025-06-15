class Todo < Sequel::Model
  plugin :timestamps

  def validate
    super
    errors.add(:title, 'cannot be empty') if !title || title.empty?
  end

  def before_create
    super
    self.created_at ||= Time.now
    self.updated_at ||= Time.now
  end

  def before_update
    super
    self.updated_at = Time.now
  end

  def to_model
    self
  end

  def persisted?
    !new?
  end

  def model_name
    ActiveModel::Name.new(self.class, nil, "Todo")
  end

  def to_param
    id.to_s if id
  end

  def completed?
    completed
  end
end