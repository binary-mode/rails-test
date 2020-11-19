module RequestSpecHelper
  def stub_is_admin
    controller.singleton_class.class_exec do
      helper_method :is_admin?
      define_method :is_admin? do
        false
      end
    end
  end
end
