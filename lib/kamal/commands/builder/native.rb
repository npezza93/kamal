class Kamal::Commands::Builder::Native < Kamal::Commands::Builder::Base
  def create
    # No-op on native without cache
  end

  def remove
    # No-op on native without cache
  end

  def push
    combine \
      docker(:build, *platform, *build_options, build_context),
      docker(:push, config.absolute_image),
      docker(:push, config.latest_image)
  end

  def info
    # No-op on native
  end

  def platform
    ["--platform", config.builder.platform] if config.builder.platform
  end
end
