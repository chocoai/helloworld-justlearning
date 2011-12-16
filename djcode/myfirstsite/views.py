from django.shortcuts import render_to_response
from django.http import HttpResponse
import datetime


def display_meta(request):
    values = request.META.items()
    values.sort()
    return render_to_response('info_meta.html', locals())
    # html = []
    # for k, v in values:
    #     html.append('<tr><td>%s</td><td>%s</td></tr>' % (k, v))
    # return HttpResponse('<table>%s</table>' % '\n'.join(html))


def debug(request):
    pass


def temp(request):
    return render_to_response('temp.html', locals())


def current_datetime(request):
    current_date = datetime.datetime.now()
#   assert False
    return render_to_response('current_datetime.html', locals())


def hours_ahead(request, hours_offset):
    next_time = datetime.datetime.now() + datetime.timedelta(hours = int(hours_offset))
    return render_to_response('hours_ahead.html', locals())
