module Rails3BeforeRender
  module BeforeRenderInstance
    extend ActiveSupport::Concern

    included do
      alias_method_chain :render, :before_render_filter
      define_callbacks :render
    end

    def render_with_before_render_filter *opts, &blk
      args = [ :render ]
      args << action_name if ActionPack::VERSION::STRING =~ /^3/

      run_callbacks *args do
        render_without_before_render_filter(*opts, &blk)
      end
    end

  end
end

ActionController::Base.send :include,  Rails3BeforeRender::BeforeRenderInstance