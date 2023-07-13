defmodule PasswordApiWeb.PasswordController do
  use PasswordApiWeb, :controller

  def encrypt_password(conn, %{"password" => password}) do
    encrypted_password = Bcrypt.hash_pwd_salt(password)
    json(conn, %{encrypted_password: encrypted_password})
  end

  def test(conn, _params) do
    json(conn, %{message: "Working"})
  end

end
