class RootController
  attr_accessor :env

  def initialize(env)
    self.env = env
  end

  def show
    body = render_with_layout("views/root/show.html.haml")
    [200, {}, [body]]
  end

  def render(template_path)
    template = File.open(template_path, "r").read
    Haml::Engine.new(template).render
  end

  def render_with_layout(template_path)
    layout = File.open("views/layouts/app.html.haml", "r").read
    Haml::Engine.new(layout).render do
      render(template_path)
    end
  end
end
