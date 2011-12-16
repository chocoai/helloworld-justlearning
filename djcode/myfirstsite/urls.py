from django.conf import settings
from django.conf.urls.defaults import *
from myfirstsite.books import views
from myfirstsite.views import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()
urlpatterns = patterns('',
                       (r'^display/$', display_meta),
                       (r'^temp/$', temp),
                       (r'^time/$', current_datetime),
                       (r'^time/plus/(\d{1,2})/$', hours_ahead),
                       (r'^search/$', views.search),
    # Example:
    # (r'^myfirstsite/', include('myfirstsite.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
)


urlpatterns += patterns('myfirstsite.contact.views',
                       (r'^contact/$', 'contact'),
                       (r'^contact/thanks/$', 'thanks'),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^debuginfo/$', debug),
    )
