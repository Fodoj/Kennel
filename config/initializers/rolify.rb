Rolify.configure do |c|
  # User class to put the roles association. Default is: "User"
  c.user_cname = "Person"
  # Role class provided by Rolify. Default is: "Role"
  # c.role_cname = "Role"
  # Dynamic shortcuts for Role class (user.is_admin? like methods). Default is: false
  # c.dynamic_shortcuts = false if !defined?(Rails::Server) || !defined?(Rails::Console)
end