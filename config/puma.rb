# config/puma.rb

# Número de threads por worker (mínimo e máximo iguais)
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Porta que o Puma vai escutar (Render define automaticamente)
port ENV.fetch("PORT") { 3000 }

# Ambiente (production no Render)
environment ENV.fetch("RAILS_ENV") { "production" }

# Número de workers (processos) — só habilita se não for Windows
if RUBY_PLATFORM !~ /mswin|mingw|cygwin/
  workers ENV.fetch("WEB_CONCURRENCY") { 2 }

  # Preload para economizar memória e acelerar inicialização
  preload_app!

  # Reconectar ao banco em cada worker
  on_worker_boot do
    ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
  end
end

# Permite reiniciar Puma com `rails restart`
plugin :tmp_restart

# Executa Solid Queue supervisor dentro do Puma (se configurado)
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Define PID file se informado
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
