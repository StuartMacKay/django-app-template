from django.views.generic import TemplateView


class IndexView(TemplateView):
    template_name = "app_project/index.html"
