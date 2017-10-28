desc "Remove old searches"
task :remove_old_searches => :enviroment do
	Search.delete_all ["created_at < ?", 1.hour.ago]
end