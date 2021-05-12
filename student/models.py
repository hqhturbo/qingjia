from django.db import models
#主管
class dept(models.Model):
    dname = models.CharField(max_length=20)
    dpwd = models.CharField(max_length=20)
#员工
class emp(models.Model):
    ename = models.CharField(max_length=20)
    epwd=models.CharField(max_length=20)
    bname = models.CharField(max_length=20)
    did = models.ForeignKey(dept,on_delete=models.CASCADE)
#请假类型
class yuanyin(models.Model):
    yname=models.CharField(max_length=20)
#请假表
class qj(models.Model):
    title= models.CharField(max_length=100)
    statime=models.DateField()
    endtime=models.DateField()
    yid=models.ForeignKey(yuanyin,on_delete=models.CASCADE)
    eid=models.ForeignKey(emp,on_delete=models.CASCADE)
    time=models.DateField(auto_now_add=True)
#审批
class shenpi(models.Model):
    stime=models.CharField(max_length=20,null=True)
    sys=models.CharField(max_length=20)
    yes_ok=models.CharField(max_length=20,null=True)
    qid=models.OneToOneField(qj,on_delete=models.CASCADE)
    say=models.CharField(max_length=100,null=True)



