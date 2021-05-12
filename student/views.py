import datetime
import json

from django import forms
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import *
from django.views import View
from student.models import *

# 引入原生sql
from django.db import connection

cursor = connection.cursor()


# 登录
class Login(View):
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        user = request.POST.get('user')
        pwd = request.POST.get('pwd')
        nn = int(request.POST.get('nn'))
        if nn == 1:  # 员工登录
            n = emp.objects.filter(ename=user, epwd=pwd).first()
            if n:
                request.session['name'] = n.ename
                request.session['id'] = n.id
                lo = redirect(reverse('empall'))
                lo.set_cookie('ticket', '123123', max_age=3)
                return lo
            else:
                return redirect(reverse('login'))
        elif nn == 2:  # 老板登录
            n = dept.objects.filter(dname=user, dpwd=pwd).first()
            if n:
                request.session['name'] = n.dname
                request.session['id'] = n.id
                lo = redirect(reverse('deptall'))
                lo.set_cookie('ticket', '123', max_age=3)
                return lo
            else:
                return redirect(reverse('login'))


# 主页
class Empall(View):  # 员工
    def get(self, request):
        id = request.session['id']
        b = emp.objects.filter(id=id)
        if b:
            s_all = cursor.execute("""SELECT qj.id,emp.ename,yy.yname,qj.statime,qj.endtime,qj.title,
                emp.bname,dept.dname,qj.time,sp.stime,sp.sys,sp.yes_ok 
                from student_shenpi sp,student_qj qj,student_emp emp,student_dept dept, student_yuanyin yy
                where qj.id=sp.qid_id and emp.id=qj.eid_id and qj.yid_id=yy.id and dept.id=emp.did_id 
                and emp.id={} ORDER BY qj.id
                    """.format(id))
            s_all = cursor.fetchall()
            y_all = yuanyin.objects.all()
            # #分页
            page = request.GET.get('page')
            p = Paginator(s_all, 5)
            try:
                pp = p.page(page)
            except Exception as e:
                pp = p.page(1)
            if page is None:
                page = int(1)
            page = int(page)
            s = page * 5 - 4
            e = page * 5
            if page == p.num_pages:  # 如果是最后一页
                e = p.count  # 结束位置为他的总条数
            return render(request, 'empall.html', {'y_all': y_all, "pp": pp, 'page': page, "p": p, 's': s, 'e': e})
        else:
            return redirect(reverse('login'))


class deptall(View):  # 老板
    def get(self, request):
        id = request.session['id']
        b = dept.objects.filter(id=id)
        if b:
            s_all = cursor.execute("""SELECT qj.id,emp.ename,yy.yname,qj.statime,qj.endtime,qj.title,
                    emp.bname,dept.dname,qj.time,sp.stime,sp.sys,sp.yes_ok 
                    from student_shenpi sp,student_qj qj,student_emp emp,student_dept dept, student_yuanyin yy
                    where qj.id=sp.qid_id and emp.id=qj.eid_id and qj.yid_id=yy.id and dept.id=emp.did_id 
                    and dept.id={} ORDER BY qj.id
                    """.format(id))
            s_all = cursor.fetchall()
            y_all = yuanyin.objects.all()
            # 分页
            page = request.GET.get('page')
            p = Paginator(s_all, 5)
            try:
                pp = p.page(page)
            except Exception as e:
                pp = p.page(1)
            if page is None:
                page = int(1)
            page = int(page)
            s = page * 5 - 4
            e = page * 5
            if page == p.num_pages:  # 如果是最后一页
                e = p.count  # 结束位置为他的总条数
            return render(request, 'deptall.html', {'y_all': y_all, "pp": pp, 'page': page, "p": p, 's': s, 'e': e})
        else:
            return redirect(reverse('login'))


# 模糊查询
def select_all(request):
    n1 = request.POST.get('n1')  # 姓名
    zt = request.POST.get('zt')  # 是否归档
    ay = request.POST.get('ay')  # 全部类型
    ayy = request.POST.get('ayy')  # 单个类型
    loo = []
    # if n1:  # 输入了姓名
    if n1 == '':
        n1 = request.session['name']
    if ay == "全部":  # 选择了全部类型
        cursor.execute("""
        SELECT qj.id,emp.ename,yy.yname,qj.statime,qj.endtime,qj.title,
            emp.bname,dept.dname,qj.time,sp.stime,sp.sys,sp.yes_ok 
            from student_shenpi sp,student_qj qj,student_emp emp,student_dept dept, student_yuanyin yy
            where qj.id=sp.qid_id and emp.id=qj.eid_id and qj.yid_id=yy.id and dept.id=emp.did_id 
            and sp.sys='{}' and emp.ename='{}' ORDER BY qj.id
            """.format(zt, n1))
        s_all = cursor.fetchall()
    else:  # 未选择全部类型 使用ayy
        cursor.execute("""
        SELECT qj.id,emp.ename,yy.yname,qj.statime,qj.endtime,qj.title,
            emp.bname,dept.dname,qj.time,sp.stime,sp.sys,sp.yes_ok 
            from student_shenpi sp,student_qj qj,student_emp emp,student_dept dept, student_yuanyin yy
            where qj.id=sp.qid_id and emp.id=qj.eid_id and qj.yid_id=yy.id and dept.id=emp.did_id 
            and yy.yname='{}' and sp.sys='{}' and emp.ename='{}' ORDER BY qj.id
            """.format(ayy, zt, n1))
        s_all = cursor.fetchall()
    for i in s_all:
        data = {
            'i0': i[0],
            'i1': i[1],
            'i2': i[2],
            'i3': i[3],
            'i4': i[4],
            'i5': i[5],
            'i6': i[6],
            'i7': i[7],
            'i8': i[8],
            'i9': i[9],
            'i10': i[10],
            'i11': i[11],
        }
        loo.append(data)
    return JsonResponse(loo, safe=False)


# 模糊查询老板
def select_dept_all(request):
    n1 = request.POST.get('n1')  # 姓名
    zt = request.POST.get('zt')  # 是否归档
    ay = request.POST.get('ay')  # 全部类型
    ayy = request.POST.get('ayy')  # 单个类型
    id = request.session['id']  # 老板id
    loo = []
    if n1:  # 输入了姓名
        if ay == "全部":  # 选择了全部类型
            cursor.execute("""
            SELECT qj.id,emp.ename,yy.yname,qj.statime,qj.endtime,qj.title,
            emp.bname,dept.dname,qj.time,sp.stime,sp.sys,sp.yes_ok 
            from student_shenpi sp,student_qj qj,student_emp emp,student_dept dept, student_yuanyin yy
            where qj.id=sp.qid_id and emp.id=qj.eid_id and qj.yid_id=yy.id and dept.id=emp.did_id 
            and sp.sys='{}' and emp.ename='{}' and dept.id={} ORDER BY qj.id
                """.format(zt, n1, id))
            s_all = cursor.fetchall()
        else:  # 未选择全部类型 使用ayy
            cursor.execute("""
            SELECT qj.id,emp.ename,yy.yname,qj.statime,qj.endtime,qj.title,
            emp.bname,dept.dname,qj.time,sp.stime,sp.sys,sp.yes_ok 
            from student_shenpi sp,student_qj qj,student_emp emp,student_dept dept, student_yuanyin yy
            where qj.id=sp.qid_id and emp.id=qj.eid_id and qj.yid_id=yy.id and dept.id=emp.did_id 
            and sp.sys='{}' and emp.ename='{}' and yy.yname='{}'  and dept.id={} ORDER BY qj.id
                """.format(zt, n1, ayy, id))
            s_all = cursor.fetchall()
    else:  # 未输入姓名
        if ay == "全部":  # 选择了全部类型
            cursor.execute("""
            SELECT qj.id,emp.ename,yy.yname,qj.statime,qj.endtime,qj.title,
            emp.bname,dept.dname,qj.time,sp.stime,sp.sys,sp.yes_ok 
            from student_shenpi sp,student_qj qj,student_emp emp,student_dept dept, student_yuanyin yy
            where qj.id=sp.qid_id and emp.id=qj.eid_id and qj.yid_id=yy.id and dept.id=emp.did_id 
            and sp.sys='{}'  and dept.id={} ORDER BY qj.id
                """.format(zt, id))
            s_all = cursor.fetchall()
        else:  # 未选择全部类型 使用ayy
            cursor.execute("""
            SELECT qj.id,emp.ename,yy.yname,qj.statime,qj.endtime,qj.title,
            emp.bname,dept.dname,qj.time,sp.stime,sp.sys,sp.yes_ok 
            from student_shenpi sp,student_qj qj,student_emp emp,student_dept dept, student_yuanyin yy
            where qj.id=sp.qid_id and emp.id=qj.eid_id and qj.yid_id=yy.id and dept.id=emp.did_id 
            and yy.yname='{}' and sp.sys='{}'  and dept.id={} ORDER BY qj.id
                """.format(ayy, zt, id))
            s_all = cursor.fetchall()
    for i in s_all:
        data = {
            'i0': i[0],
            'i1': i[1],
            'i2': i[2],
            'i3': i[3],
            'i4': i[4],
            'i5': i[5],
            'i6': i[6],
            'i7': i[7],
            'i8': i[8],
            'i9': i[9],
            'i10': i[10],
            'i11': i[11],
        }
        loo.append(data)
    return JsonResponse(loo, safe=False)


# 批量删除
def delall(request):
    list = request.POST.getlist('lis')
    if '全部' in list:
        list.remove('全部')
    if 'on' in list:
        list.remove('on')
    for i in list:
        qj.objects.filter(id=i).delete()
        shenpi.objects.filter(qid_id=i).delete()
    return redirect('/empall/')


# 添加
class AddForm(forms.Form):
    title = forms.CharField(
        required=True,
        error_messages={
            "required": "请假原因不能为空",
        })
    statime = forms.DateField(
        required=True,
        error_messages={
            "required": "请假时间不能为空",
        })
    endtime = forms.DateField(
        required=True,
        error_messages={
            "required": "请假时间不能为空",
        })
class Add(View):
    def get(self, request):
        y_all = yuanyin.objects.all()
        return render(request, 'add.html', {'y_all': y_all})
    def post(self, request):
        yid = request.POST.get('yid')
        yz=AddForm(request.POST)
        if yz.is_valid():
            statime = yz.cleaned_data['statime']
            endtime = yz.cleaned_data['endtime']
            title = yz.cleaned_data['title']
            new = qj.objects.create(title=title, statime=statime, endtime=endtime,
                                    eid_id=request.session['id'], yid_id=yid)
            shenpi.objects.create(sys='审核中', qid_id=new.id, stime='', yes_ok='')
            return redirect('/empall/')
        else:
            erro=yz.errors
            y_all = yuanyin.objects.all()
            return render(request, 'add.html', {'y_all': y_all,'erro':erro})
        # statime = request.POST.get('statime')
        # endtime = request.POST.get('endtime')
        # title = request.POST.get('title')
        # new = qj.objects.create(title=title, statime=statime, endtime=endtime,
        #                         eid_id=request.session['id'], yid_id=yid)
        # shenpi.objects.create(sys='审核中', qid_id=new.id, stime='', yes_ok='')
        # return redirect('/empall/')
def ajaxadd(request):
    yid = request.POST.get('yid')
    statime = request.POST.get('statime')
    endtime = request.POST.get('endtime')
    title = request.POST.get('title')
    new = qj.objects.create(title=title, statime=statime, endtime=endtime,
                            eid_id=request.session['id'], yid_id=yid)
    shenpi.objects.create(sys='审核中', qid_id=new.id, stime='', yes_ok='')
    return HttpResponse('添加成功')

# 修改
class update(View):
    def get(self, request):
        y_all = yuanyin.objects.all()
        id = request.GET.get('id')
        q = qj.objects.get(id=id)
        return render(request, 'update.html', {'y_all': y_all, "q": q})

    def post(self, request):
        qid = request.POST.get('qid')
        yid = request.POST.get('yid')
        statime = request.POST.get('statime')
        endtime = request.POST.get('endtime')
        title = request.POST.get('title')
        qj.objects.filter(id=qid).update(title=title, statime=statime, endtime=endtime, yid_id=yid)
        return redirect('/empall/')


# 老板修改审批
class dept_update(View):
    def get(self, request):
        y_all = yuanyin.objects.all()
        id = request.GET.get('id')
        q = qj.objects.get(id=id)
        return render(request, 'dept_update.html', {'y_all': y_all, "q": q})

    def post(self, request):
        qid = request.POST.get('qid')
        yes_ok = request.POST.get('yes_ok')
        say = request.POST.get('say')
        stime = datetime.date.today()
        if say == "":
            say = ''
        shenpi.objects.filter(qid_id=qid).update(stime=stime, yes_ok=yes_ok, say=say, sys='已归档')
        return redirect('/deptall/')


# 查看
class update1(View):
    def get(self, request):
        y_all = yuanyin.objects.all()
        id = request.GET.get('id')
        s = shenpi.objects.filter(qid_id=id)
        return render(request, 'update1.html', {'y_all': y_all, "s": s})


# 老板查看
class dept_update1(View):
    def get(self, request):
        y_all = yuanyin.objects.all()
        id = request.GET.get('id')
        s = shenpi.objects.filter(qid_id=id)
        return render(request, 'dept_update1.html', {'y_all': y_all, "s": s})
