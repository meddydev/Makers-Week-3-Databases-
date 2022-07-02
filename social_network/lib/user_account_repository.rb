require_relative "./user_account"

class UserAccountRepository
  def all
    query = "SELECT * FROM user_accounts;"
    params = []

    result_set = DatabaseConnection.exec_params(query, params)

    user_accounts = []

    result_set.each do |record|
      user_accounts << record_to_user_account_object(record)
    end

    user_accounts
  end

  def find(id)
    query = "SELECT * FROM user_accounts WHERE id = $1;"
    params = [id]

    result_set = DatabaseConnection.exec_params(query, params)
    record = result_set[0]

    record_to_user_account_object(record)
  end

  def create(user_account)
    query = "INSERT INTO user_accounts (email_address, username) VALUES($1, $2);"
    params = [user_account.email_address, user_account.username]

    DatabaseConnection.exec_params(query, params)
  end

  def update(user_account)
    query = "UPDATE user_accounts SET email_address = $1, username = $2 WHERE id = $3;"
    params = [user_account.email_address, user_account.username, user_account.id]

    DatabaseConnection.exec_params(query, params)
  end

  def delete(id)
    query = "DELETE FROM user_accounts WHERE id = $1;"
    params = [id]

    DatabaseConnection.exec_params(query, params)
  end

  private

  def record_to_user_account_object(record)
    user_account = UserAccount.new
    user_account.id = record["id"].to_i
    user_account.email_address = record["email_address"]
    user_account.username = record["username"]
    user_account
  end
end
