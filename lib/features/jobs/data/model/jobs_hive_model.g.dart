// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'jobs_hive_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class JobHiveModelAdapter extends TypeAdapter<JobHiveModel> {
//   @override
//   final int typeId = 1;

//   @override
//   JobHiveModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return JobHiveModel(
//       jobId: fields[0] as String?,
//       title: fields[1] as String,
//       companyId: fields[2] as String,
//       location: fields[3] as String,
//       description: fields[4] as String,
//       requirements: (fields[5] as List).cast<String>(),
//       salary: fields[6] as double,
//       experienceLevel: fields[7] as int,
//       jobType: fields[8] as String,
//       position: fields[9] as int,
//       createdBy: fields[10] as String,
//       applications: (fields[11] as List).cast<String>(),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, JobHiveModel obj) {
//     writer
//       ..writeByte(12)
//       ..writeByte(0)
//       ..write(obj.jobId)
//       ..writeByte(1)
//       ..write(obj.title)
//       ..writeByte(2)
//       ..write(obj.companyId)
//       ..writeByte(3)
//       ..write(obj.location)
//       ..writeByte(4)
//       ..write(obj.description)
//       ..writeByte(5)
//       ..write(obj.requirements)
//       ..writeByte(6)
//       ..write(obj.salary)
//       ..writeByte(7)
//       ..write(obj.experienceLevel)
//       ..writeByte(8)
//       ..write(obj.jobType)
//       ..writeByte(9)
//       ..write(obj.position)
//       ..writeByte(10)
//       ..write(obj.createdBy)
//       ..writeByte(11)
//       ..write(obj.applications);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is JobHiveModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
