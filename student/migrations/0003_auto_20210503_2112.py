# Generated by Django 2.0 on 2021-05-03 13:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0002_auto_20210503_1559'),
    ]

    operations = [
        migrations.AlterField(
            model_name='qj',
            name='title',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='shenpi',
            name='say',
            field=models.CharField(max_length=100, null=True),
        ),
    ]