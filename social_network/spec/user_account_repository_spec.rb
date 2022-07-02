require "user_account_repository"

describe UserAccountRepository do
  def reset_user_accounts_table
    seed_sql = File.read("spec/seeds_user_accounts.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "social_network_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_user_accounts_table
  end

  it "retrieves all user accounts" do
    repo = UserAccountRepository.new

    user_accounts = repo.all

    expect(user_accounts.length).to eq 3

    expect(user_accounts[0].id).to eq 1
    expect(user_accounts[0].email_address).to eq "abc123@makers.org"
    expect(user_accounts[0].username).to eq "Abbie123"

    expect(user_accounts[2].id).to eq 3
    expect(user_accounts[2].email_address).to eq "ahmed@gmail.com"
    expect(user_accounts[2].username).to eq "AwesomeAhmed"
  end

  it "retrieves a user account given an id" do
    repo = UserAccountRepository.new

    user_account = repo.find(2)

    expect(user_account.id).to eq 2
    expect(user_account.email_address).to eq "jimmyo@yahoo.com"
    expect(user_account.username).to eq "BigJim"
  end

  it "creates a new user account" do
    new_account = UserAccount.new
    new_account.email_address = "blah@yahoo.com"
    new_account.username = "blahblah"

    repo = UserAccountRepository.new
    repo.create(new_account)

    new_account = repo.find(4)

    expect(new_account.email_address).to eq "blah@yahoo.com"
    expect(new_account.username).to eq "blahblah"
    expect(repo.all.length).to eq 4
  end

  it "updates all of user account fields (apart from id)" do
    repo = UserAccountRepository.new

    user_account = repo.find(3)
    user_account.username = "Meddy"
    user_account.email_address = "meddy@hotmail.com"

    repo.update(user_account)

    updated_user_account = repo.find(3)

    expect(updated_user_account.username).to eq "Meddy"
    expect(user_account.email_address).to eq "meddy@hotmail.com"
  end

  it "updates one of user account fields" do
    repo = UserAccountRepository.new

    user_account = repo.find(3)
    user_account.email_address = "meddy@hotmail.com"

    repo.update(user_account)

    updated_user_account = repo.find(3)

    expect(updated_user_account.username).to eq "AwesomeAhmed"
    expect(user_account.email_address).to eq "meddy@hotmail.com"
  end

  it "deletes a user account" do
    repo = UserAccountRepository.new

    repo.delete(1)
    repo.delete(2)

    expect(repo.all.length).to eq 1
    expect(repo.all.first.id).to eq 3
    expect(repo.all.first.username).to eq "AwesomeAhmed"
  end
end
