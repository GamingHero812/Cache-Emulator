; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @registerFunctions() local_unnamed_addr #0 !dbg !9 {
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @transpose_submit, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #4, !dbg !13
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_basic, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !14
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_tmp, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !15
  ret void, !dbg !16
}

declare !dbg !17 void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @transpose_submit(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef readnone %4) #2 !dbg !36 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !38, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata i64 %1, metadata !39, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata double* %2, metadata !40, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata double* %3, metadata !41, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata double* %4, metadata !42, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata i64 8, metadata !43, metadata !DIExpression()), !dbg !66
  %6 = icmp eq i64 %0, 32, !dbg !67
  %7 = icmp eq i64 %1, 32
  %8 = and i1 %6, %7, !dbg !68
  br i1 %8, label %9, label %66, !dbg !68

9:                                                ; preds = %5, %63
  %10 = phi i64 [ %64, %63 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !44, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.value(metadata i64 0, metadata !47, metadata !DIExpression()), !dbg !69
  br label %11, !dbg !70

11:                                               ; preds = %9, %60
  %12 = phi i64 [ 0, %9 ], [ %61, %60 ]
  call void @llvm.dbg.value(metadata i64 %12, metadata !47, metadata !DIExpression()), !dbg !69
  %13 = icmp eq i64 %10, %12
  call void @llvm.dbg.value(metadata i64 0, metadata !48, metadata !DIExpression()), !dbg !69
  br i1 %13, label %14, label %39, !dbg !75

14:                                               ; preds = %11, %20
  %15 = phi i64 [ %25, %20 ], [ 0, %11 ]
  call void @llvm.dbg.value(metadata i64 %15, metadata !48, metadata !DIExpression()), !dbg !69
  %16 = add nuw nsw i64 %15, %10
  call void @llvm.dbg.value(metadata i64 0, metadata !49, metadata !DIExpression()), !dbg !69
  %17 = shl nsw i64 %16, 5
  %18 = getelementptr inbounds double, double* %2, i64 %17
  %19 = getelementptr inbounds double, double* %3, i64 %16
  br label %27, !dbg !81

20:                                               ; preds = %36
  %21 = getelementptr inbounds double, double* %18, i64 %16, !dbg !83
  %22 = load double, double* %21, align 8, !dbg !83, !tbaa !86
  %23 = getelementptr inbounds double, double* %3, i64 %17, !dbg !90
  %24 = getelementptr inbounds double, double* %23, i64 %16, !dbg !90
  store double %22, double* %24, align 8, !dbg !91, !tbaa !86
  %25 = add nuw nsw i64 %15, 1, !dbg !92
  call void @llvm.dbg.value(metadata i64 %25, metadata !48, metadata !DIExpression()), !dbg !69
  %26 = icmp eq i64 %25, 8, !dbg !93
  br i1 %26, label %60, label %14, !dbg !94, !llvm.loop !95

27:                                               ; preds = %36, %14
  %28 = phi i64 [ 0, %14 ], [ %37, %36 ]
  call void @llvm.dbg.value(metadata i64 %28, metadata !49, metadata !DIExpression()), !dbg !69
  %29 = add nuw nsw i64 %28, %10, !dbg !98
  %30 = icmp eq i64 %28, %15, !dbg !102
  br i1 %30, label %36, label %31, !dbg !103

31:                                               ; preds = %27
  %32 = getelementptr inbounds double, double* %18, i64 %29, !dbg !104
  %33 = load double, double* %32, align 8, !dbg !104, !tbaa !86
  %34 = shl nsw i64 %29, 5, !dbg !106
  %35 = getelementptr inbounds double, double* %19, i64 %34, !dbg !106
  store double %33, double* %35, align 8, !dbg !107, !tbaa !86
  br label %36, !dbg !108

36:                                               ; preds = %31, %27
  %37 = add nuw nsw i64 %28, 1, !dbg !109
  call void @llvm.dbg.value(metadata i64 %37, metadata !49, metadata !DIExpression()), !dbg !69
  %38 = icmp eq i64 %37, 8, !dbg !110
  br i1 %38, label %20, label %27, !dbg !81, !llvm.loop !111

39:                                               ; preds = %11, %57
  %40 = phi i64 [ %58, %57 ], [ 0, %11 ]
  call void @llvm.dbg.value(metadata i64 %40, metadata !48, metadata !DIExpression()), !dbg !69
  %41 = add nuw nsw i64 %40, %10
  call void @llvm.dbg.value(metadata i64 0, metadata !49, metadata !DIExpression()), !dbg !69
  %42 = shl nsw i64 %41, 5
  %43 = getelementptr inbounds double, double* %2, i64 %42
  %44 = getelementptr inbounds double, double* %3, i64 %41
  br label %45, !dbg !81

45:                                               ; preds = %39, %54
  %46 = phi i64 [ 0, %39 ], [ %55, %54 ]
  call void @llvm.dbg.value(metadata i64 %46, metadata !49, metadata !DIExpression()), !dbg !69
  %47 = add nuw nsw i64 %46, %12, !dbg !98
  %48 = icmp eq i64 %47, %41, !dbg !102
  br i1 %48, label %54, label %49, !dbg !103

49:                                               ; preds = %45
  %50 = getelementptr inbounds double, double* %43, i64 %47, !dbg !104
  %51 = load double, double* %50, align 8, !dbg !104, !tbaa !86
  %52 = shl nsw i64 %47, 5, !dbg !106
  %53 = getelementptr inbounds double, double* %44, i64 %52, !dbg !106
  store double %51, double* %53, align 8, !dbg !107, !tbaa !86
  br label %54, !dbg !108

54:                                               ; preds = %45, %49
  %55 = add nuw nsw i64 %46, 1, !dbg !109
  call void @llvm.dbg.value(metadata i64 %55, metadata !49, metadata !DIExpression()), !dbg !69
  %56 = icmp eq i64 %55, 8, !dbg !110
  br i1 %56, label %57, label %45, !dbg !81, !llvm.loop !111

57:                                               ; preds = %54
  %58 = add nuw nsw i64 %40, 1, !dbg !92
  call void @llvm.dbg.value(metadata i64 %58, metadata !48, metadata !DIExpression()), !dbg !69
  %59 = icmp eq i64 %58, 8, !dbg !93
  br i1 %59, label %60, label %39, !dbg !94, !llvm.loop !95

60:                                               ; preds = %57, %20
  %61 = add nuw nsw i64 %12, 8, !dbg !113
  call void @llvm.dbg.value(metadata i64 %61, metadata !47, metadata !DIExpression()), !dbg !69
  %62 = icmp ult i64 %12, 24, !dbg !114
  br i1 %62, label %11, label %63, !dbg !70, !llvm.loop !115

63:                                               ; preds = %60
  %64 = add nuw nsw i64 %10, 8, !dbg !117
  call void @llvm.dbg.value(metadata i64 %64, metadata !44, metadata !DIExpression()), !dbg !69
  %65 = icmp ult i64 %10, 24, !dbg !118
  br i1 %65, label %9, label %173, !dbg !119, !llvm.loop !120

66:                                               ; preds = %5
  %67 = icmp eq i64 %0, 1024, !dbg !122
  %68 = icmp eq i64 %1, 1024
  %69 = and i1 %67, %68, !dbg !123
  br i1 %69, label %70, label %123, !dbg !123

70:                                               ; preds = %66, %121
  %71 = phi i64 [ %72, %121 ], [ 0, %66 ]
  call void @llvm.dbg.value(metadata i64 %71, metadata !50, metadata !DIExpression()), !dbg !124
  %72 = add nuw nsw i64 %71, 8
  call void @llvm.dbg.value(metadata i64 0, metadata !53, metadata !DIExpression()), !dbg !124
  br label %75, !dbg !125

73:                                               ; preds = %95, %114
  call void @llvm.dbg.value(metadata i64 %77, metadata !53, metadata !DIExpression()), !dbg !124
  %74 = icmp ult i64 %76, 1016, !dbg !126
  br i1 %74, label %75, label %121, !dbg !125, !llvm.loop !127

75:                                               ; preds = %73, %70
  %76 = phi i64 [ %77, %73 ], [ 0, %70 ]
  call void @llvm.dbg.value(metadata i64 %76, metadata !53, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.value(metadata i64 %71, metadata !54, metadata !DIExpression()), !dbg !129
  %77 = add nuw nsw i64 %76, 8
  %78 = icmp eq i64 %71, %76
  br i1 %78, label %98, label %79, !dbg !130

79:                                               ; preds = %75, %95
  %80 = phi i64 [ %96, %95 ], [ %71, %75 ]
  call void @llvm.dbg.value(metadata i64 %80, metadata !54, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i64 %76, metadata !62, metadata !DIExpression()), !dbg !131
  %81 = shl nsw i64 %80, 10
  %82 = getelementptr inbounds double, double* %2, i64 %81
  %83 = getelementptr inbounds double, double* %3, i64 %80
  br label %84, !dbg !132

84:                                               ; preds = %92, %79
  %85 = phi i64 [ %76, %79 ], [ %93, %92 ]
  call void @llvm.dbg.value(metadata i64 %85, metadata !62, metadata !DIExpression()), !dbg !131
  %86 = icmp eq i64 %80, %85, !dbg !133
  br i1 %86, label %92, label %87, !dbg !137

87:                                               ; preds = %84
  %88 = getelementptr inbounds double, double* %82, i64 %85, !dbg !138
  %89 = load double, double* %88, align 8, !dbg !138, !tbaa !86
  %90 = shl nsw i64 %85, 10, !dbg !140
  %91 = getelementptr inbounds double, double* %83, i64 %90, !dbg !140
  store double %89, double* %91, align 8, !dbg !141, !tbaa !86
  br label %92, !dbg !142

92:                                               ; preds = %87, %84
  %93 = add nuw nsw i64 %85, 1, !dbg !143
  call void @llvm.dbg.value(metadata i64 %93, metadata !62, metadata !DIExpression()), !dbg !131
  %94 = icmp ult i64 %93, %77, !dbg !144
  br i1 %94, label %84, label %95, !dbg !132, !llvm.loop !145

95:                                               ; preds = %92
  %96 = add nuw nsw i64 %80, 1, !dbg !147
  call void @llvm.dbg.value(metadata i64 %96, metadata !54, metadata !DIExpression()), !dbg !129
  %97 = icmp ult i64 %96, %72, !dbg !148
  br i1 %97, label %79, label %73, !dbg !149, !llvm.loop !150

98:                                               ; preds = %75, %114
  %99 = phi i64 [ %119, %114 ], [ %71, %75 ]
  call void @llvm.dbg.value(metadata i64 %99, metadata !54, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i64 %76, metadata !62, metadata !DIExpression()), !dbg !131
  %100 = shl nsw i64 %99, 10
  %101 = getelementptr inbounds double, double* %2, i64 %100
  %102 = getelementptr inbounds double, double* %3, i64 %99
  br label %103, !dbg !132

103:                                              ; preds = %111, %98
  %104 = phi i64 [ %71, %98 ], [ %112, %111 ]
  call void @llvm.dbg.value(metadata i64 %104, metadata !62, metadata !DIExpression()), !dbg !131
  %105 = icmp eq i64 %99, %104, !dbg !133
  br i1 %105, label %111, label %106, !dbg !137

106:                                              ; preds = %103
  %107 = getelementptr inbounds double, double* %101, i64 %104, !dbg !138
  %108 = load double, double* %107, align 8, !dbg !138, !tbaa !86
  %109 = shl nsw i64 %104, 10, !dbg !140
  %110 = getelementptr inbounds double, double* %102, i64 %109, !dbg !140
  store double %108, double* %110, align 8, !dbg !141, !tbaa !86
  br label %111, !dbg !142

111:                                              ; preds = %106, %103
  %112 = add nuw nsw i64 %104, 1, !dbg !143
  call void @llvm.dbg.value(metadata i64 %112, metadata !62, metadata !DIExpression()), !dbg !131
  %113 = icmp ult i64 %112, %77, !dbg !144
  br i1 %113, label %103, label %114, !dbg !132, !llvm.loop !145

114:                                              ; preds = %111
  %115 = getelementptr inbounds double, double* %101, i64 %99, !dbg !152
  %116 = load double, double* %115, align 8, !dbg !152, !tbaa !86
  %117 = getelementptr inbounds double, double* %3, i64 %100, !dbg !155
  %118 = getelementptr inbounds double, double* %117, i64 %99, !dbg !155
  store double %116, double* %118, align 8, !dbg !156, !tbaa !86
  %119 = add nuw nsw i64 %99, 1, !dbg !147
  call void @llvm.dbg.value(metadata i64 %119, metadata !54, metadata !DIExpression()), !dbg !129
  %120 = icmp ult i64 %119, %72, !dbg !148
  br i1 %120, label %98, label %73, !dbg !149, !llvm.loop !150

121:                                              ; preds = %73
  call void @llvm.dbg.value(metadata i64 %72, metadata !50, metadata !DIExpression()), !dbg !124
  %122 = icmp ult i64 %71, 1016, !dbg !157
  br i1 %122, label %70, label %173, !dbg !158, !llvm.loop !159

123:                                              ; preds = %66
  call void @llvm.dbg.value(metadata i64 %0, metadata !161, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.value(metadata i64 %1, metadata !164, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.value(metadata double* %2, metadata !165, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.value(metadata double* %3, metadata !166, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.value(metadata double* %4, metadata !167, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.value(metadata i64 0, metadata !168, metadata !DIExpression()), !dbg !177
  %124 = icmp eq i64 %1, 0, !dbg !178
  %125 = icmp eq i64 %0, 0
  %126 = or i1 %125, %124, !dbg !179
  br i1 %126, label %173, label %127, !dbg !179

127:                                              ; preds = %123
  %128 = icmp ugt i64 %0, 1
  %129 = icmp eq i64 %1, 1
  %130 = and i1 %128, %129
  %131 = and i64 %0, -2
  %132 = icmp eq i64 %131, %0
  br label %133, !dbg !179

133:                                              ; preds = %127, %170
  %134 = phi i64 [ %171, %170 ], [ 0, %127 ]
  call void @llvm.dbg.value(metadata i64 %134, metadata !168, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i64 0, metadata !170, metadata !DIExpression()), !dbg !180
  %135 = mul i64 %134, %0
  %136 = mul nsw i64 %134, %0
  %137 = getelementptr inbounds double, double* %2, i64 %136
  %138 = getelementptr inbounds double, double* %3, i64 %134
  br i1 %130, label %139, label %160, !dbg !181

139:                                              ; preds = %133
  %140 = add i64 %135, %0
  %141 = getelementptr double, double* %2, i64 %140
  %142 = getelementptr double, double* %2, i64 %135
  %143 = add i64 %134, %0
  %144 = getelementptr double, double* %3, i64 %143
  %145 = getelementptr double, double* %3, i64 %134
  %146 = icmp ult double* %145, %141, !dbg !181
  %147 = icmp ult double* %142, %144, !dbg !181
  %148 = and i1 %146, %147, !dbg !181
  br i1 %148, label %160, label %149

149:                                              ; preds = %139, %149
  %150 = phi i64 [ %157, %149 ], [ 0, %139 ], !dbg !182
  %151 = getelementptr inbounds double, double* %137, i64 %150, !dbg !182
  %152 = bitcast double* %151 to <2 x double>*, !dbg !184
  %153 = load <2 x double>, <2 x double>* %152, align 8, !dbg !184, !tbaa !86, !alias.scope !186
  %154 = mul nsw i64 %150, %1, !dbg !182
  %155 = getelementptr inbounds double, double* %138, i64 %154, !dbg !182
  %156 = bitcast double* %155 to <2 x double>*, !dbg !189
  store <2 x double> %153, <2 x double>* %156, align 8, !dbg !189, !tbaa !86, !alias.scope !190, !noalias !186
  %157 = add nuw i64 %150, 2, !dbg !182
  %158 = icmp eq i64 %157, %131, !dbg !182
  br i1 %158, label %159, label %149, !dbg !182, !llvm.loop !192

159:                                              ; preds = %149
  br i1 %132, label %170, label %160, !dbg !181

160:                                              ; preds = %139, %133, %159
  %161 = phi i64 [ 0, %139 ], [ 0, %133 ], [ %131, %159 ]
  br label %162, !dbg !181

162:                                              ; preds = %160, %162
  %163 = phi i64 [ %168, %162 ], [ %161, %160 ]
  call void @llvm.dbg.value(metadata i64 %163, metadata !170, metadata !DIExpression()), !dbg !180
  %164 = getelementptr inbounds double, double* %137, i64 %163, !dbg !184
  %165 = load double, double* %164, align 8, !dbg !184, !tbaa !86
  %166 = mul nsw i64 %163, %1, !dbg !195
  %167 = getelementptr inbounds double, double* %138, i64 %166, !dbg !195
  store double %165, double* %167, align 8, !dbg !189, !tbaa !86
  %168 = add nuw i64 %163, 1, !dbg !182
  call void @llvm.dbg.value(metadata i64 %168, metadata !170, metadata !DIExpression()), !dbg !180
  %169 = icmp eq i64 %168, %0, !dbg !196
  br i1 %169, label %170, label %162, !dbg !181, !llvm.loop !197

170:                                              ; preds = %162, %159
  %171 = add nuw i64 %134, 1, !dbg !198
  call void @llvm.dbg.value(metadata i64 %171, metadata !168, metadata !DIExpression()), !dbg !177
  %172 = icmp eq i64 %171, %1, !dbg !178
  br i1 %172, label %173, label %133, !dbg !179, !llvm.loop !199

173:                                              ; preds = %170, %121, %63, %123
  ret void, !dbg !201
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_basic(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef readnone %4) #2 !dbg !162 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !161, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.value(metadata i64 %1, metadata !164, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.value(metadata double* %2, metadata !165, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.value(metadata double* %3, metadata !166, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.value(metadata double* %4, metadata !167, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.value(metadata i64 0, metadata !168, metadata !DIExpression()), !dbg !203
  %6 = icmp eq i64 %1, 0, !dbg !204
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !205
  br i1 %8, label %55, label %9, !dbg !205

9:                                                ; preds = %5
  %10 = icmp ugt i64 %0, 1
  %11 = icmp eq i64 %1, 1
  %12 = and i1 %10, %11
  %13 = and i64 %0, -2
  %14 = icmp eq i64 %13, %0
  br label %15, !dbg !205

15:                                               ; preds = %9, %52
  %16 = phi i64 [ %53, %52 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %16, metadata !168, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.value(metadata i64 0, metadata !170, metadata !DIExpression()), !dbg !206
  %17 = mul i64 %16, %0
  %18 = mul nsw i64 %16, %0
  %19 = getelementptr inbounds double, double* %2, i64 %18
  %20 = getelementptr inbounds double, double* %3, i64 %16
  br i1 %12, label %21, label %42, !dbg !207

21:                                               ; preds = %15
  %22 = add i64 %17, %0
  %23 = getelementptr double, double* %2, i64 %22
  %24 = getelementptr double, double* %2, i64 %17
  %25 = add i64 %16, %0
  %26 = getelementptr double, double* %3, i64 %25
  %27 = getelementptr double, double* %3, i64 %16
  %28 = icmp ult double* %27, %23, !dbg !207
  %29 = icmp ult double* %24, %26, !dbg !207
  %30 = and i1 %28, %29, !dbg !207
  br i1 %30, label %42, label %31

31:                                               ; preds = %21, %31
  %32 = phi i64 [ %39, %31 ], [ 0, %21 ], !dbg !208
  %33 = getelementptr inbounds double, double* %19, i64 %32, !dbg !208
  %34 = bitcast double* %33 to <2 x double>*, !dbg !209
  %35 = load <2 x double>, <2 x double>* %34, align 8, !dbg !209, !tbaa !86, !alias.scope !210
  %36 = mul nsw i64 %32, %1, !dbg !208
  %37 = getelementptr inbounds double, double* %20, i64 %36, !dbg !208
  %38 = bitcast double* %37 to <2 x double>*, !dbg !213
  store <2 x double> %35, <2 x double>* %38, align 8, !dbg !213, !tbaa !86, !alias.scope !214, !noalias !210
  %39 = add nuw i64 %32, 2, !dbg !208
  %40 = icmp eq i64 %39, %13, !dbg !208
  br i1 %40, label %41, label %31, !dbg !208, !llvm.loop !216

41:                                               ; preds = %31
  br i1 %14, label %52, label %42, !dbg !207

42:                                               ; preds = %21, %15, %41
  %43 = phi i64 [ 0, %21 ], [ 0, %15 ], [ %13, %41 ]
  br label %44, !dbg !207

44:                                               ; preds = %42, %44
  %45 = phi i64 [ %50, %44 ], [ %43, %42 ]
  call void @llvm.dbg.value(metadata i64 %45, metadata !170, metadata !DIExpression()), !dbg !206
  %46 = getelementptr inbounds double, double* %19, i64 %45, !dbg !209
  %47 = load double, double* %46, align 8, !dbg !209, !tbaa !86
  %48 = mul nsw i64 %45, %1, !dbg !218
  %49 = getelementptr inbounds double, double* %20, i64 %48, !dbg !218
  store double %47, double* %49, align 8, !dbg !213, !tbaa !86
  %50 = add nuw i64 %45, 1, !dbg !208
  call void @llvm.dbg.value(metadata i64 %50, metadata !170, metadata !DIExpression()), !dbg !206
  %51 = icmp eq i64 %50, %0, !dbg !219
  br i1 %51, label %52, label %44, !dbg !207, !llvm.loop !220

52:                                               ; preds = %44, %41
  %53 = add nuw i64 %16, 1, !dbg !221
  call void @llvm.dbg.value(metadata i64 %53, metadata !168, metadata !DIExpression()), !dbg !203
  %54 = icmp eq i64 %53, %1, !dbg !204
  br i1 %54, label %55, label %15, !dbg !205, !llvm.loop !222

55:                                               ; preds = %52, %5
  ret void, !dbg !224
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_tmp(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef writeonly %4) #2 !dbg !225 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !227, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.value(metadata i64 %1, metadata !228, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.value(metadata double* %2, metadata !229, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.value(metadata double* %3, metadata !230, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.value(metadata double* %4, metadata !231, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.value(metadata i64 0, metadata !232, metadata !DIExpression()), !dbg !243
  %6 = icmp eq i64 %1, 0, !dbg !244
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !245
  br i1 %8, label %30, label %9, !dbg !245

9:                                                ; preds = %5, %27
  %10 = phi i64 [ %28, %27 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !232, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i64 0, metadata !234, metadata !DIExpression()), !dbg !246
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = shl i64 %10, 1
  %14 = and i64 %13, 2
  %15 = getelementptr inbounds double, double* %3, i64 %10
  br label %16, !dbg !247

16:                                               ; preds = %9, %16
  %17 = phi i64 [ 0, %9 ], [ %25, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !234, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.value(metadata i64 %10, metadata !238, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !248
  %18 = and i64 %17, 1, !dbg !249
  call void @llvm.dbg.value(metadata i64 %18, metadata !241, metadata !DIExpression()), !dbg !248
  %19 = getelementptr inbounds double, double* %12, i64 %17, !dbg !250
  %20 = load double, double* %19, align 8, !dbg !250, !tbaa !86
  %21 = or i64 %18, %14, !dbg !251
  %22 = getelementptr inbounds double, double* %4, i64 %21, !dbg !252
  store double %20, double* %22, align 8, !dbg !253, !tbaa !86
  %23 = mul nsw i64 %17, %1, !dbg !254
  %24 = getelementptr inbounds double, double* %15, i64 %23, !dbg !254
  store double %20, double* %24, align 8, !dbg !255, !tbaa !86
  %25 = add nuw i64 %17, 1, !dbg !256
  call void @llvm.dbg.value(metadata i64 %25, metadata !234, metadata !DIExpression()), !dbg !246
  %26 = icmp eq i64 %25, %0, !dbg !257
  br i1 %26, label %27, label %16, !dbg !247, !llvm.loop !258

27:                                               ; preds = %16
  %28 = add nuw i64 %10, 1, !dbg !260
  call void @llvm.dbg.value(metadata i64 %28, metadata !232, metadata !DIExpression()), !dbg !243
  %29 = icmp eq i64 %28, %1, !dbg !244
  br i1 %29, label %30, label %9, !dbg !245, !llvm.loop !261

30:                                               ; preds = %27, %5
  ret void, !dbg !263
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr17/abisheka/private/18213/cachelab4-GamingHero812")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!9 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 176, type: !10, scopeLine: 176, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !12)
!10 = !DISubroutineType(types: !11)
!11 = !{null}
!12 = !{}
!13 = !DILocation(line: 178, column: 5, scope: !9)
!14 = !DILocation(line: 181, column: 5, scope: !9)
!15 = !DILocation(line: 182, column: 5, scope: !9)
!16 = !DILocation(line: 183, column: 1, scope: !9)
!17 = !DISubprogram(name: "registerTransFunction", scope: !18, file: !18, line: 99, type: !19, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !12)
!18 = !DIFile(filename: "./cachelab.h", directory: "/afs/andrew.cmu.edu/usr17/abisheka/private/18213/cachelab4-GamingHero812")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21, !33}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24, !24, !27, !27, !32}
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !25, line: 46, baseType: !26)
!25 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "")
!26 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, elements: !30)
!29 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!30 = !{!31}
!31 = !DISubrange(count: -1)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 125, type: !22, scopeLine: 126, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !37)
!37 = !{!38, !39, !40, !41, !42, !43, !44, !47, !48, !49, !50, !53, !54, !62}
!38 = !DILocalVariable(name: "M", arg: 1, scope: !36, file: !1, line: 125, type: !24)
!39 = !DILocalVariable(name: "N", arg: 2, scope: !36, file: !1, line: 125, type: !24)
!40 = !DILocalVariable(name: "A", arg: 3, scope: !36, file: !1, line: 125, type: !27)
!41 = !DILocalVariable(name: "B", arg: 4, scope: !36, file: !1, line: 125, type: !27)
!42 = !DILocalVariable(name: "tmp", arg: 5, scope: !36, file: !1, line: 126, type: !32)
!43 = !DILocalVariable(name: "BLOCK_SIZE", scope: !36, file: !1, line: 127, type: !24)
!44 = !DILocalVariable(name: "a", scope: !45, file: !1, line: 129, type: !24)
!45 = distinct !DILexicalBlock(scope: !46, file: !1, line: 128, column: 29)
!46 = distinct !DILexicalBlock(scope: !36, file: !1, line: 128, column: 9)
!47 = !DILocalVariable(name: "b", scope: !45, file: !1, line: 130, type: !24)
!48 = !DILocalVariable(name: "c", scope: !45, file: !1, line: 131, type: !24)
!49 = !DILocalVariable(name: "d", scope: !45, file: !1, line: 132, type: !24)
!50 = !DILocalVariable(name: "r", scope: !51, file: !1, line: 148, type: !24)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 147, column: 40)
!52 = distinct !DILexicalBlock(scope: !46, file: !1, line: 147, column: 16)
!53 = !DILocalVariable(name: "c", scope: !51, file: !1, line: 149, type: !24)
!54 = !DILocalVariable(name: "i", scope: !55, file: !1, line: 152, type: !24)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 152, column: 17)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 151, column: 49)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 151, column: 13)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 151, column: 13)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 150, column: 45)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 150, column: 9)
!61 = distinct !DILexicalBlock(scope: !51, file: !1, line: 150, column: 9)
!62 = !DILocalVariable(name: "j", scope: !63, file: !1, line: 153, type: !24)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 153, column: 21)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 152, column: 61)
!65 = distinct !DILexicalBlock(scope: !55, file: !1, line: 152, column: 17)
!66 = !DILocation(line: 0, scope: !36)
!67 = !DILocation(line: 128, column: 11, scope: !46)
!68 = !DILocation(line: 128, column: 17, scope: !46)
!69 = !DILocation(line: 0, scope: !45)
!70 = !DILocation(line: 134, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 134, column: 13)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 133, column: 45)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 133, column: 9)
!74 = distinct !DILexicalBlock(scope: !45, file: !1, line: 133, column: 9)
!75 = !DILocation(line: 141, column: 25, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 135, column: 50)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 135, column: 17)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 135, column: 17)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 134, column: 49)
!80 = distinct !DILexicalBlock(scope: !71, file: !1, line: 134, column: 13)
!81 = !DILocation(line: 136, column: 21, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !1, line: 136, column: 21)
!83 = !DILocation(line: 142, column: 43, scope: !84)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 141, column: 33)
!85 = distinct !DILexicalBlock(scope: !76, file: !1, line: 141, column: 25)
!86 = !{!87, !87, i64 0}
!87 = !{!"double", !88, i64 0}
!88 = !{!"omnipotent char", !89, i64 0}
!89 = !{!"Simple C/C++ TBAA"}
!90 = !DILocation(line: 142, column: 25, scope: !84)
!91 = !DILocation(line: 142, column: 41, scope: !84)
!92 = !DILocation(line: 135, column: 46, scope: !77)
!93 = !DILocation(line: 135, column: 31, scope: !77)
!94 = !DILocation(line: 135, column: 17, scope: !78)
!95 = distinct !{!95, !94, !96, !97}
!96 = !DILocation(line: 144, column: 17, scope: !78)
!97 = !{!"llvm.loop.unroll.disable"}
!98 = !DILocation(line: 137, column: 31, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 137, column: 29)
!100 = distinct !DILexicalBlock(scope: !101, file: !1, line: 136, column: 54)
!101 = distinct !DILexicalBlock(scope: !82, file: !1, line: 136, column: 21)
!102 = !DILocation(line: 137, column: 35, scope: !99)
!103 = !DILocation(line: 137, column: 29, scope: !100)
!104 = !DILocation(line: 138, column: 47, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !1, line: 137, column: 45)
!106 = !DILocation(line: 138, column: 29, scope: !105)
!107 = !DILocation(line: 138, column: 45, scope: !105)
!108 = !DILocation(line: 139, column: 25, scope: !105)
!109 = !DILocation(line: 136, column: 50, scope: !101)
!110 = !DILocation(line: 136, column: 35, scope: !101)
!111 = distinct !{!111, !81, !112, !97}
!112 = !DILocation(line: 140, column: 21, scope: !82)
!113 = !DILocation(line: 134, column: 34, scope: !80)
!114 = !DILocation(line: 134, column: 27, scope: !80)
!115 = distinct !{!115, !70, !116, !97}
!116 = !DILocation(line: 145, column: 13, scope: !71)
!117 = !DILocation(line: 133, column: 30, scope: !73)
!118 = !DILocation(line: 133, column: 23, scope: !73)
!119 = !DILocation(line: 133, column: 9, scope: !74)
!120 = distinct !{!120, !119, !121, !97}
!121 = !DILocation(line: 146, column: 9, scope: !74)
!122 = !DILocation(line: 147, column: 18, scope: !52)
!123 = !DILocation(line: 147, column: 26, scope: !52)
!124 = !DILocation(line: 0, scope: !51)
!125 = !DILocation(line: 151, column: 13, scope: !58)
!126 = !DILocation(line: 151, column: 27, scope: !57)
!127 = distinct !{!127, !125, !128, !97}
!128 = !DILocation(line: 162, column: 13, scope: !58)
!129 = !DILocation(line: 0, scope: !55)
!130 = !DILocation(line: 158, column: 25, scope: !64)
!131 = !DILocation(line: 0, scope: !63)
!132 = !DILocation(line: 153, column: 21, scope: !63)
!133 = !DILocation(line: 154, column: 31, scope: !134)
!134 = distinct !DILexicalBlock(scope: !135, file: !1, line: 154, column: 29)
!135 = distinct !DILexicalBlock(scope: !136, file: !1, line: 153, column: 65)
!136 = distinct !DILexicalBlock(scope: !63, file: !1, line: 153, column: 21)
!137 = !DILocation(line: 154, column: 29, scope: !135)
!138 = !DILocation(line: 155, column: 39, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !1, line: 154, column: 37)
!140 = !DILocation(line: 155, column: 29, scope: !139)
!141 = !DILocation(line: 155, column: 37, scope: !139)
!142 = !DILocation(line: 156, column: 25, scope: !139)
!143 = !DILocation(line: 153, column: 61, scope: !136)
!144 = !DILocation(line: 153, column: 42, scope: !136)
!145 = distinct !{!145, !132, !146, !97}
!146 = !DILocation(line: 157, column: 21, scope: !63)
!147 = !DILocation(line: 152, column: 57, scope: !65)
!148 = !DILocation(line: 152, column: 38, scope: !65)
!149 = !DILocation(line: 152, column: 17, scope: !55)
!150 = distinct !{!150, !149, !151, !97}
!151 = !DILocation(line: 161, column: 17, scope: !55)
!152 = !DILocation(line: 159, column: 35, scope: !153)
!153 = distinct !DILexicalBlock(scope: !154, file: !1, line: 158, column: 33)
!154 = distinct !DILexicalBlock(scope: !64, file: !1, line: 158, column: 25)
!155 = !DILocation(line: 159, column: 25, scope: !153)
!156 = !DILocation(line: 159, column: 33, scope: !153)
!157 = !DILocation(line: 150, column: 23, scope: !60)
!158 = !DILocation(line: 150, column: 9, scope: !61)
!159 = distinct !{!159, !158, !160, !97}
!160 = !DILocation(line: 163, column: 9, scope: !61)
!161 = !DILocalVariable(name: "M", arg: 1, scope: !162, file: !1, line: 81, type: !24)
!162 = distinct !DISubprogram(name: "trans_basic", scope: !1, file: !1, line: 81, type: !22, scopeLine: 82, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !163)
!163 = !{!161, !164, !165, !166, !167, !168, !170}
!164 = !DILocalVariable(name: "N", arg: 2, scope: !162, file: !1, line: 81, type: !24)
!165 = !DILocalVariable(name: "A", arg: 3, scope: !162, file: !1, line: 81, type: !27)
!166 = !DILocalVariable(name: "B", arg: 4, scope: !162, file: !1, line: 81, type: !27)
!167 = !DILocalVariable(name: "tmp", arg: 5, scope: !162, file: !1, line: 82, type: !32)
!168 = !DILocalVariable(name: "i", scope: !169, file: !1, line: 86, type: !24)
!169 = distinct !DILexicalBlock(scope: !162, file: !1, line: 86, column: 5)
!170 = !DILocalVariable(name: "j", scope: !171, file: !1, line: 87, type: !24)
!171 = distinct !DILexicalBlock(scope: !172, file: !1, line: 87, column: 9)
!172 = distinct !DILexicalBlock(scope: !173, file: !1, line: 86, column: 36)
!173 = distinct !DILexicalBlock(scope: !169, file: !1, line: 86, column: 5)
!174 = !DILocation(line: 0, scope: !162, inlinedAt: !175)
!175 = distinct !DILocation(line: 165, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !52, file: !1, line: 164, column: 12)
!177 = !DILocation(line: 0, scope: !169, inlinedAt: !175)
!178 = !DILocation(line: 86, column: 26, scope: !173, inlinedAt: !175)
!179 = !DILocation(line: 86, column: 5, scope: !169, inlinedAt: !175)
!180 = !DILocation(line: 0, scope: !171, inlinedAt: !175)
!181 = !DILocation(line: 87, column: 9, scope: !171, inlinedAt: !175)
!182 = !DILocation(line: 87, column: 36, scope: !183, inlinedAt: !175)
!183 = distinct !DILexicalBlock(scope: !171, file: !1, line: 87, column: 9)
!184 = !DILocation(line: 88, column: 23, scope: !185, inlinedAt: !175)
!185 = distinct !DILexicalBlock(scope: !183, file: !1, line: 87, column: 40)
!186 = !{!187}
!187 = distinct !{!187, !188}
!188 = distinct !{!188, !"LVerDomain"}
!189 = !DILocation(line: 88, column: 21, scope: !185, inlinedAt: !175)
!190 = !{!191}
!191 = distinct !{!191, !188}
!192 = distinct !{!192, !181, !193, !97, !194}
!193 = !DILocation(line: 89, column: 9, scope: !171, inlinedAt: !175)
!194 = !{!"llvm.loop.isvectorized", i32 1}
!195 = !DILocation(line: 88, column: 13, scope: !185, inlinedAt: !175)
!196 = !DILocation(line: 87, column: 30, scope: !183, inlinedAt: !175)
!197 = distinct !{!197, !181, !193, !97, !194}
!198 = !DILocation(line: 86, column: 32, scope: !173, inlinedAt: !175)
!199 = distinct !{!199, !179, !200, !97}
!200 = !DILocation(line: 90, column: 5, scope: !169, inlinedAt: !175)
!201 = !DILocation(line: 167, column: 1, scope: !36)
!202 = !DILocation(line: 0, scope: !162)
!203 = !DILocation(line: 0, scope: !169)
!204 = !DILocation(line: 86, column: 26, scope: !173)
!205 = !DILocation(line: 86, column: 5, scope: !169)
!206 = !DILocation(line: 0, scope: !171)
!207 = !DILocation(line: 87, column: 9, scope: !171)
!208 = !DILocation(line: 87, column: 36, scope: !183)
!209 = !DILocation(line: 88, column: 23, scope: !185)
!210 = !{!211}
!211 = distinct !{!211, !212}
!212 = distinct !{!212, !"LVerDomain"}
!213 = !DILocation(line: 88, column: 21, scope: !185)
!214 = !{!215}
!215 = distinct !{!215, !212}
!216 = distinct !{!216, !207, !217, !97, !194}
!217 = !DILocation(line: 89, column: 9, scope: !171)
!218 = !DILocation(line: 88, column: 13, scope: !185)
!219 = !DILocation(line: 87, column: 30, scope: !183)
!220 = distinct !{!220, !207, !217, !97, !194}
!221 = !DILocation(line: 86, column: 32, scope: !173)
!222 = distinct !{!222, !205, !223, !97}
!223 = !DILocation(line: 90, column: 5, scope: !169)
!224 = !DILocation(line: 93, column: 1, scope: !162)
!225 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 101, type: !22, scopeLine: 102, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !226)
!226 = !{!227, !228, !229, !230, !231, !232, !234, !238, !241}
!227 = !DILocalVariable(name: "M", arg: 1, scope: !225, file: !1, line: 101, type: !24)
!228 = !DILocalVariable(name: "N", arg: 2, scope: !225, file: !1, line: 101, type: !24)
!229 = !DILocalVariable(name: "A", arg: 3, scope: !225, file: !1, line: 101, type: !27)
!230 = !DILocalVariable(name: "B", arg: 4, scope: !225, file: !1, line: 101, type: !27)
!231 = !DILocalVariable(name: "tmp", arg: 5, scope: !225, file: !1, line: 102, type: !32)
!232 = !DILocalVariable(name: "i", scope: !233, file: !1, line: 106, type: !24)
!233 = distinct !DILexicalBlock(scope: !225, file: !1, line: 106, column: 5)
!234 = !DILocalVariable(name: "j", scope: !235, file: !1, line: 107, type: !24)
!235 = distinct !DILexicalBlock(scope: !236, file: !1, line: 107, column: 9)
!236 = distinct !DILexicalBlock(scope: !237, file: !1, line: 106, column: 36)
!237 = distinct !DILexicalBlock(scope: !233, file: !1, line: 106, column: 5)
!238 = !DILocalVariable(name: "di", scope: !239, file: !1, line: 108, type: !24)
!239 = distinct !DILexicalBlock(scope: !240, file: !1, line: 107, column: 40)
!240 = distinct !DILexicalBlock(scope: !235, file: !1, line: 107, column: 9)
!241 = !DILocalVariable(name: "dj", scope: !239, file: !1, line: 109, type: !24)
!242 = !DILocation(line: 0, scope: !225)
!243 = !DILocation(line: 0, scope: !233)
!244 = !DILocation(line: 106, column: 26, scope: !237)
!245 = !DILocation(line: 106, column: 5, scope: !233)
!246 = !DILocation(line: 0, scope: !235)
!247 = !DILocation(line: 107, column: 9, scope: !235)
!248 = !DILocation(line: 0, scope: !239)
!249 = !DILocation(line: 109, column: 27, scope: !239)
!250 = !DILocation(line: 110, column: 32, scope: !239)
!251 = !DILocation(line: 110, column: 24, scope: !239)
!252 = !DILocation(line: 110, column: 13, scope: !239)
!253 = !DILocation(line: 110, column: 30, scope: !239)
!254 = !DILocation(line: 111, column: 13, scope: !239)
!255 = !DILocation(line: 111, column: 21, scope: !239)
!256 = !DILocation(line: 107, column: 36, scope: !240)
!257 = !DILocation(line: 107, column: 30, scope: !240)
!258 = distinct !{!258, !247, !259, !97}
!259 = !DILocation(line: 112, column: 9, scope: !235)
!260 = !DILocation(line: 106, column: 32, scope: !237)
!261 = distinct !{!261, !245, !262, !97}
!262 = !DILocation(line: 113, column: 5, scope: !233)
!263 = !DILocation(line: 116, column: 1, scope: !225)
