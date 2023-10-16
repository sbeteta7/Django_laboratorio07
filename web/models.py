# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class TblAlumno(models.Model):
    alumno_id = models.AutoField(primary_key=True)
    alumno_nombre = models.CharField(max_length=100)
    alumno_email = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_alumno'


class TblMatricula(models.Model):
    matricula_id = models.AutoField(primary_key=True)
    matricula_grupo = models.CharField(max_length=255)
    alumno = models.ForeignKey(TblAlumno, on_delete=models.CASCADE)
    profesor = models.ForeignKey('TblProfesor', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tbl_matricula'


class TblProfesor(models.Model):
    profesor_id = models.AutoField(primary_key=True)
    profesor_nombre = models.CharField(max_length=255)
    profesor_email = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'tbl_profesor'
