; ModuleID = '1.ll'
source_filename = "test_progama_assume.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_s16_ansi(ptr noundef readonly captures(none) %A, ptr noundef readonly captures(none) %B, ptr noundef writeonly captures(none) %C, i32 noundef %m, i32 noundef %n, i32 noundef %k, i32 noundef %shift) local_unnamed_addr #0 {
entry:
  %cmp48 = icmp sgt i32 %m, 0
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp246 = icmp sgt i32 %k, 0
  %shr = lshr i32 32767, %shift
  %conv = zext nneg i32 %shr to i64
  %sh_prom = zext nneg i32 %shift to i64
  %shr18 = lshr i64 %conv, %sh_prom
  %conv19 = trunc nuw nsw i64 %shr18 to i16
  br i1 %cmp246, label %for.cond1.preheader.lr.ph.split.us, label %for.cond.cleanup

for.cond1.preheader.lr.ph.split.us:               ; preds = %for.cond1.preheader.lr.ph
  %cmp643 = icmp sgt i32 %n, 0
  br i1 %cmp643, label %for.cond1.preheader.us.us.preheader, label %for.cond1.preheader.us.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph.split.us
  br label %for.cond1.preheader.us

for.cond1.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.lr.ph.split.us
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us
  %i.049.us.us = phi i32 [ %inc27.us.us, %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us ], [ 0, %for.cond1.preheader.us.us.preheader ]
  %mul.us.us = mul nuw nsw i32 %i.049.us.us, %n
  %0 = getelementptr i16, ptr %A, i32 %mul.us.us
  %mul20.us.us = mul nuw nsw i32 %i.049.us.us, %k
  %1 = getelementptr i16, ptr %C, i32 %mul20.us.us
  br label %for.body4.us.us.us

for.body4.us.us.us:                               ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.3, %for.cond1.preheader.us.us
  %j.047.us.us.us = phi i32 [ 0, %for.cond1.preheader.us.us ], [ %inc24.us.us.us.3, %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.3 ]
  %invariant.gep.us.us.us = getelementptr i16, ptr %B, i32 %j.047.us.us.us
  br label %for.body9.us.us.us

for.body9.us.us.us:                               ; preds = %for.body9.us.us.us.3, %for.body4.us.us.us
  %s.045.us.us.us = phi i32 [ 0, %for.body4.us.us.us ], [ %inc.us.us.us.3, %for.body9.us.us.us.3 ]
  %acc.044.us.us.us = phi i64 [ %conv, %for.body4.us.us.us ], [ %add17.us.us.us.3, %for.body9.us.us.us.3 ]
  %arrayidx.us.us.us = getelementptr i16, ptr %0, i32 %s.045.us.us.us
  %2 = load i16, ptr %arrayidx.us.us.us, align 2, !tbaa !6
  %conv10.us.us.us = sext i16 %2 to i32
  %mul11.us.us.us = mul nuw nsw i32 %s.045.us.us.us, %k
  %gep.us.us.us = getelementptr i16, ptr %invariant.gep.us.us.us, i32 %mul11.us.us.us
  %3 = load i16, ptr %gep.us.us.us, align 2, !tbaa !6
  %conv14.us.us.us = sext i16 %3 to i32
  %mul15.us.us.us = mul nsw i32 %conv14.us.us.us, %conv10.us.us.us
  %conv16.us.us.us = sext i32 %mul15.us.us.us to i64
  %add17.us.us.us = add nsw i64 %acc.044.us.us.us, %conv16.us.us.us
  %inc.us.us.us = or disjoint i32 %s.045.us.us.us, 1
  %exitcond60.not = icmp eq i32 %inc.us.us.us, %n
  br i1 %exitcond60.not, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us, label %for.body9.us.us.us.1, !llvm.loop !10

for.body9.us.us.us.1:                             ; preds = %for.body9.us.us.us
  %arrayidx.us.us.us.1 = getelementptr i16, ptr %0, i32 %inc.us.us.us
  %4 = load i16, ptr %arrayidx.us.us.us.1, align 2, !tbaa !6
  %conv10.us.us.us.1 = sext i16 %4 to i32
  %mul11.us.us.us.1 = mul nuw nsw i32 %inc.us.us.us, %k
  %gep.us.us.us.1 = getelementptr i16, ptr %invariant.gep.us.us.us, i32 %mul11.us.us.us.1
  %5 = load i16, ptr %gep.us.us.us.1, align 2, !tbaa !6
  %conv14.us.us.us.1 = sext i16 %5 to i32
  %mul15.us.us.us.1 = mul nsw i32 %conv14.us.us.us.1, %conv10.us.us.us.1
  %conv16.us.us.us.1 = sext i32 %mul15.us.us.us.1 to i64
  %add17.us.us.us.1 = add nsw i64 %add17.us.us.us, %conv16.us.us.us.1
  %inc.us.us.us.1 = or disjoint i32 %s.045.us.us.us, 2
  %exitcond60.not.1 = icmp eq i32 %inc.us.us.us.1, %n
  br i1 %exitcond60.not.1, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us, label %for.body9.us.us.us.2, !llvm.loop !10

for.body9.us.us.us.2:                             ; preds = %for.body9.us.us.us.1
  %arrayidx.us.us.us.2 = getelementptr i16, ptr %0, i32 %inc.us.us.us.1
  %6 = load i16, ptr %arrayidx.us.us.us.2, align 2, !tbaa !6
  %conv10.us.us.us.2 = sext i16 %6 to i32
  %mul11.us.us.us.2 = mul nuw nsw i32 %inc.us.us.us.1, %k
  %gep.us.us.us.2 = getelementptr i16, ptr %invariant.gep.us.us.us, i32 %mul11.us.us.us.2
  %7 = load i16, ptr %gep.us.us.us.2, align 2, !tbaa !6
  %conv14.us.us.us.2 = sext i16 %7 to i32
  %mul15.us.us.us.2 = mul nsw i32 %conv14.us.us.us.2, %conv10.us.us.us.2
  %conv16.us.us.us.2 = sext i32 %mul15.us.us.us.2 to i64
  %add17.us.us.us.2 = add nsw i64 %add17.us.us.us.1, %conv16.us.us.us.2
  %inc.us.us.us.2 = or disjoint i32 %s.045.us.us.us, 3
  %exitcond60.not.2 = icmp eq i32 %inc.us.us.us.2, %n
  br i1 %exitcond60.not.2, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us, label %for.body9.us.us.us.3, !llvm.loop !10

for.body9.us.us.us.3:                             ; preds = %for.body9.us.us.us.2
  %arrayidx.us.us.us.3 = getelementptr i16, ptr %0, i32 %inc.us.us.us.2
  %8 = load i16, ptr %arrayidx.us.us.us.3, align 2, !tbaa !6
  %conv10.us.us.us.3 = sext i16 %8 to i32
  %mul11.us.us.us.3 = mul nuw nsw i32 %inc.us.us.us.2, %k
  %gep.us.us.us.3 = getelementptr i16, ptr %invariant.gep.us.us.us, i32 %mul11.us.us.us.3
  %9 = load i16, ptr %gep.us.us.us.3, align 2, !tbaa !6
  %conv14.us.us.us.3 = sext i16 %9 to i32
  %mul15.us.us.us.3 = mul nsw i32 %conv14.us.us.us.3, %conv10.us.us.us.3
  %conv16.us.us.us.3 = sext i32 %mul15.us.us.us.3 to i64
  %add17.us.us.us.3 = add nsw i64 %add17.us.us.us.2, %conv16.us.us.us.3
  %inc.us.us.us.3 = add nuw nsw i32 %s.045.us.us.us, 4
  %exitcond60.not.3 = icmp eq i32 %inc.us.us.us.3, %n
  br i1 %exitcond60.not.3, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us, label %for.body9.us.us.us, !llvm.loop !12

for.cond5.for.cond.cleanup8_crit_edge.us.us.us:   ; preds = %for.body9.us.us.us.3, %for.body9.us.us.us.2, %for.body9.us.us.us.1, %for.body9.us.us.us
  %add17.us.us.us.lcssa = phi i64 [ %add17.us.us.us, %for.body9.us.us.us ], [ %add17.us.us.us.1, %for.body9.us.us.us.1 ], [ %add17.us.us.us.2, %for.body9.us.us.us.2 ], [ %add17.us.us.us.3, %for.body9.us.us.us.3 ]
  %shr18.us.us.us = ashr i64 %add17.us.us.us.lcssa, %sh_prom
  %conv19.us.us.us = trunc i64 %shr18.us.us.us to i16
  %arrayidx22.us.us.us = getelementptr i16, ptr %1, i32 %j.047.us.us.us
  store i16 %conv19.us.us.us, ptr %arrayidx22.us.us.us, align 2, !tbaa !6
  %inc24.us.us.us = or disjoint i32 %j.047.us.us.us, 1
  %exitcond61.not = icmp eq i32 %inc24.us.us.us, %k
  br i1 %exitcond61.not, label %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us, label %for.body4.us.us.us.1, !llvm.loop !14

for.body4.us.us.us.1:                             ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us.us
  %invariant.gep.us.us.us.1 = getelementptr i16, ptr %B, i32 %inc24.us.us.us
  br label %for.body9.us.us.us.188

for.body9.us.us.us.188:                           ; preds = %for.body9.us.us.us.3.1, %for.body4.us.us.us.1
  %s.045.us.us.us.1 = phi i32 [ 0, %for.body4.us.us.us.1 ], [ %inc.us.us.us.3.1, %for.body9.us.us.us.3.1 ]
  %acc.044.us.us.us.1 = phi i64 [ %conv, %for.body4.us.us.us.1 ], [ %add17.us.us.us.3.1, %for.body9.us.us.us.3.1 ]
  %arrayidx.us.us.us.178 = getelementptr i16, ptr %0, i32 %s.045.us.us.us.1
  %10 = load i16, ptr %arrayidx.us.us.us.178, align 2, !tbaa !6
  %conv10.us.us.us.179 = sext i16 %10 to i32
  %mul11.us.us.us.180 = mul nuw nsw i32 %s.045.us.us.us.1, %k
  %gep.us.us.us.181 = getelementptr i16, ptr %invariant.gep.us.us.us.1, i32 %mul11.us.us.us.180
  %11 = load i16, ptr %gep.us.us.us.181, align 2, !tbaa !6
  %conv14.us.us.us.182 = sext i16 %11 to i32
  %mul15.us.us.us.183 = mul nsw i32 %conv14.us.us.us.182, %conv10.us.us.us.179
  %conv16.us.us.us.184 = sext i32 %mul15.us.us.us.183 to i64
  %add17.us.us.us.185 = add nsw i64 %acc.044.us.us.us.1, %conv16.us.us.us.184
  %inc.us.us.us.186 = or disjoint i32 %s.045.us.us.us.1, 1
  %exitcond60.not.187 = icmp eq i32 %inc.us.us.us.186, %n
  br i1 %exitcond60.not.187, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.1, label %for.body9.us.us.us.1.1, !llvm.loop !10

for.body9.us.us.us.1.1:                           ; preds = %for.body9.us.us.us.188
  %arrayidx.us.us.us.1.1 = getelementptr i16, ptr %0, i32 %inc.us.us.us.186
  %12 = load i16, ptr %arrayidx.us.us.us.1.1, align 2, !tbaa !6
  %conv10.us.us.us.1.1 = sext i16 %12 to i32
  %mul11.us.us.us.1.1 = mul nuw nsw i32 %inc.us.us.us.186, %k
  %gep.us.us.us.1.1 = getelementptr i16, ptr %invariant.gep.us.us.us.1, i32 %mul11.us.us.us.1.1
  %13 = load i16, ptr %gep.us.us.us.1.1, align 2, !tbaa !6
  %conv14.us.us.us.1.1 = sext i16 %13 to i32
  %mul15.us.us.us.1.1 = mul nsw i32 %conv14.us.us.us.1.1, %conv10.us.us.us.1.1
  %conv16.us.us.us.1.1 = sext i32 %mul15.us.us.us.1.1 to i64
  %add17.us.us.us.1.1 = add nsw i64 %add17.us.us.us.185, %conv16.us.us.us.1.1
  %inc.us.us.us.1.1 = or disjoint i32 %s.045.us.us.us.1, 2
  %exitcond60.not.1.1 = icmp eq i32 %inc.us.us.us.1.1, %n
  br i1 %exitcond60.not.1.1, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.1, label %for.body9.us.us.us.2.1, !llvm.loop !10

for.body9.us.us.us.2.1:                           ; preds = %for.body9.us.us.us.1.1
  %arrayidx.us.us.us.2.1 = getelementptr i16, ptr %0, i32 %inc.us.us.us.1.1
  %14 = load i16, ptr %arrayidx.us.us.us.2.1, align 2, !tbaa !6
  %conv10.us.us.us.2.1 = sext i16 %14 to i32
  %mul11.us.us.us.2.1 = mul nuw nsw i32 %inc.us.us.us.1.1, %k
  %gep.us.us.us.2.1 = getelementptr i16, ptr %invariant.gep.us.us.us.1, i32 %mul11.us.us.us.2.1
  %15 = load i16, ptr %gep.us.us.us.2.1, align 2, !tbaa !6
  %conv14.us.us.us.2.1 = sext i16 %15 to i32
  %mul15.us.us.us.2.1 = mul nsw i32 %conv14.us.us.us.2.1, %conv10.us.us.us.2.1
  %conv16.us.us.us.2.1 = sext i32 %mul15.us.us.us.2.1 to i64
  %add17.us.us.us.2.1 = add nsw i64 %add17.us.us.us.1.1, %conv16.us.us.us.2.1
  %inc.us.us.us.2.1 = or disjoint i32 %s.045.us.us.us.1, 3
  %exitcond60.not.2.1 = icmp eq i32 %inc.us.us.us.2.1, %n
  br i1 %exitcond60.not.2.1, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.1, label %for.body9.us.us.us.3.1, !llvm.loop !10

for.body9.us.us.us.3.1:                           ; preds = %for.body9.us.us.us.2.1
  %arrayidx.us.us.us.3.1 = getelementptr i16, ptr %0, i32 %inc.us.us.us.2.1
  %16 = load i16, ptr %arrayidx.us.us.us.3.1, align 2, !tbaa !6
  %conv10.us.us.us.3.1 = sext i16 %16 to i32
  %mul11.us.us.us.3.1 = mul nuw nsw i32 %inc.us.us.us.2.1, %k
  %gep.us.us.us.3.1 = getelementptr i16, ptr %invariant.gep.us.us.us.1, i32 %mul11.us.us.us.3.1
  %17 = load i16, ptr %gep.us.us.us.3.1, align 2, !tbaa !6
  %conv14.us.us.us.3.1 = sext i16 %17 to i32
  %mul15.us.us.us.3.1 = mul nsw i32 %conv14.us.us.us.3.1, %conv10.us.us.us.3.1
  %conv16.us.us.us.3.1 = sext i32 %mul15.us.us.us.3.1 to i64
  %add17.us.us.us.3.1 = add nsw i64 %add17.us.us.us.2.1, %conv16.us.us.us.3.1
  %inc.us.us.us.3.1 = add nuw nsw i32 %s.045.us.us.us.1, 4
  %exitcond60.not.3.1 = icmp eq i32 %inc.us.us.us.3.1, %n
  br i1 %exitcond60.not.3.1, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.1, label %for.body9.us.us.us.188, !llvm.loop !12

for.cond5.for.cond.cleanup8_crit_edge.us.us.us.1: ; preds = %for.body9.us.us.us.3.1, %for.body9.us.us.us.2.1, %for.body9.us.us.us.1.1, %for.body9.us.us.us.188
  %add17.us.us.us.lcssa.1 = phi i64 [ %add17.us.us.us.185, %for.body9.us.us.us.188 ], [ %add17.us.us.us.1.1, %for.body9.us.us.us.1.1 ], [ %add17.us.us.us.2.1, %for.body9.us.us.us.2.1 ], [ %add17.us.us.us.3.1, %for.body9.us.us.us.3.1 ]
  %shr18.us.us.us.1 = ashr i64 %add17.us.us.us.lcssa.1, %sh_prom
  %conv19.us.us.us.1 = trunc i64 %shr18.us.us.us.1 to i16
  %arrayidx22.us.us.us.1 = getelementptr i16, ptr %1, i32 %inc24.us.us.us
  store i16 %conv19.us.us.us.1, ptr %arrayidx22.us.us.us.1, align 2, !tbaa !6
  %inc24.us.us.us.1 = or disjoint i32 %j.047.us.us.us, 2
  %exitcond61.not.1 = icmp eq i32 %inc24.us.us.us.1, %k
  br i1 %exitcond61.not.1, label %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us, label %for.body4.us.us.us.2, !llvm.loop !14

for.body4.us.us.us.2:                             ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.1
  %invariant.gep.us.us.us.2 = getelementptr i16, ptr %B, i32 %inc24.us.us.us.1
  br label %for.body9.us.us.us.299

for.body9.us.us.us.299:                           ; preds = %for.body9.us.us.us.3.2, %for.body4.us.us.us.2
  %s.045.us.us.us.2 = phi i32 [ 0, %for.body4.us.us.us.2 ], [ %inc.us.us.us.3.2, %for.body9.us.us.us.3.2 ]
  %acc.044.us.us.us.2 = phi i64 [ %conv, %for.body4.us.us.us.2 ], [ %add17.us.us.us.3.2, %for.body9.us.us.us.3.2 ]
  %arrayidx.us.us.us.289 = getelementptr i16, ptr %0, i32 %s.045.us.us.us.2
  %18 = load i16, ptr %arrayidx.us.us.us.289, align 2, !tbaa !6
  %conv10.us.us.us.290 = sext i16 %18 to i32
  %mul11.us.us.us.291 = mul nuw nsw i32 %s.045.us.us.us.2, %k
  %gep.us.us.us.292 = getelementptr i16, ptr %invariant.gep.us.us.us.2, i32 %mul11.us.us.us.291
  %19 = load i16, ptr %gep.us.us.us.292, align 2, !tbaa !6
  %conv14.us.us.us.293 = sext i16 %19 to i32
  %mul15.us.us.us.294 = mul nsw i32 %conv14.us.us.us.293, %conv10.us.us.us.290
  %conv16.us.us.us.295 = sext i32 %mul15.us.us.us.294 to i64
  %add17.us.us.us.296 = add nsw i64 %acc.044.us.us.us.2, %conv16.us.us.us.295
  %inc.us.us.us.297 = or disjoint i32 %s.045.us.us.us.2, 1
  %exitcond60.not.298 = icmp eq i32 %inc.us.us.us.297, %n
  br i1 %exitcond60.not.298, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.2, label %for.body9.us.us.us.1.2, !llvm.loop !10

for.body9.us.us.us.1.2:                           ; preds = %for.body9.us.us.us.299
  %arrayidx.us.us.us.1.2 = getelementptr i16, ptr %0, i32 %inc.us.us.us.297
  %20 = load i16, ptr %arrayidx.us.us.us.1.2, align 2, !tbaa !6
  %conv10.us.us.us.1.2 = sext i16 %20 to i32
  %mul11.us.us.us.1.2 = mul nuw nsw i32 %inc.us.us.us.297, %k
  %gep.us.us.us.1.2 = getelementptr i16, ptr %invariant.gep.us.us.us.2, i32 %mul11.us.us.us.1.2
  %21 = load i16, ptr %gep.us.us.us.1.2, align 2, !tbaa !6
  %conv14.us.us.us.1.2 = sext i16 %21 to i32
  %mul15.us.us.us.1.2 = mul nsw i32 %conv14.us.us.us.1.2, %conv10.us.us.us.1.2
  %conv16.us.us.us.1.2 = sext i32 %mul15.us.us.us.1.2 to i64
  %add17.us.us.us.1.2 = add nsw i64 %add17.us.us.us.296, %conv16.us.us.us.1.2
  %inc.us.us.us.1.2 = or disjoint i32 %s.045.us.us.us.2, 2
  %exitcond60.not.1.2 = icmp eq i32 %inc.us.us.us.1.2, %n
  br i1 %exitcond60.not.1.2, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.2, label %for.body9.us.us.us.2.2, !llvm.loop !10

for.body9.us.us.us.2.2:                           ; preds = %for.body9.us.us.us.1.2
  %arrayidx.us.us.us.2.2 = getelementptr i16, ptr %0, i32 %inc.us.us.us.1.2
  %22 = load i16, ptr %arrayidx.us.us.us.2.2, align 2, !tbaa !6
  %conv10.us.us.us.2.2 = sext i16 %22 to i32
  %mul11.us.us.us.2.2 = mul nuw nsw i32 %inc.us.us.us.1.2, %k
  %gep.us.us.us.2.2 = getelementptr i16, ptr %invariant.gep.us.us.us.2, i32 %mul11.us.us.us.2.2
  %23 = load i16, ptr %gep.us.us.us.2.2, align 2, !tbaa !6
  %conv14.us.us.us.2.2 = sext i16 %23 to i32
  %mul15.us.us.us.2.2 = mul nsw i32 %conv14.us.us.us.2.2, %conv10.us.us.us.2.2
  %conv16.us.us.us.2.2 = sext i32 %mul15.us.us.us.2.2 to i64
  %add17.us.us.us.2.2 = add nsw i64 %add17.us.us.us.1.2, %conv16.us.us.us.2.2
  %inc.us.us.us.2.2 = or disjoint i32 %s.045.us.us.us.2, 3
  %exitcond60.not.2.2 = icmp eq i32 %inc.us.us.us.2.2, %n
  br i1 %exitcond60.not.2.2, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.2, label %for.body9.us.us.us.3.2, !llvm.loop !10

for.body9.us.us.us.3.2:                           ; preds = %for.body9.us.us.us.2.2
  %arrayidx.us.us.us.3.2 = getelementptr i16, ptr %0, i32 %inc.us.us.us.2.2
  %24 = load i16, ptr %arrayidx.us.us.us.3.2, align 2, !tbaa !6
  %conv10.us.us.us.3.2 = sext i16 %24 to i32
  %mul11.us.us.us.3.2 = mul nuw nsw i32 %inc.us.us.us.2.2, %k
  %gep.us.us.us.3.2 = getelementptr i16, ptr %invariant.gep.us.us.us.2, i32 %mul11.us.us.us.3.2
  %25 = load i16, ptr %gep.us.us.us.3.2, align 2, !tbaa !6
  %conv14.us.us.us.3.2 = sext i16 %25 to i32
  %mul15.us.us.us.3.2 = mul nsw i32 %conv14.us.us.us.3.2, %conv10.us.us.us.3.2
  %conv16.us.us.us.3.2 = sext i32 %mul15.us.us.us.3.2 to i64
  %add17.us.us.us.3.2 = add nsw i64 %add17.us.us.us.2.2, %conv16.us.us.us.3.2
  %inc.us.us.us.3.2 = add nuw nsw i32 %s.045.us.us.us.2, 4
  %exitcond60.not.3.2 = icmp eq i32 %inc.us.us.us.3.2, %n
  br i1 %exitcond60.not.3.2, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.2, label %for.body9.us.us.us.299, !llvm.loop !12

for.cond5.for.cond.cleanup8_crit_edge.us.us.us.2: ; preds = %for.body9.us.us.us.3.2, %for.body9.us.us.us.2.2, %for.body9.us.us.us.1.2, %for.body9.us.us.us.299
  %add17.us.us.us.lcssa.2 = phi i64 [ %add17.us.us.us.296, %for.body9.us.us.us.299 ], [ %add17.us.us.us.1.2, %for.body9.us.us.us.1.2 ], [ %add17.us.us.us.2.2, %for.body9.us.us.us.2.2 ], [ %add17.us.us.us.3.2, %for.body9.us.us.us.3.2 ]
  %shr18.us.us.us.2 = ashr i64 %add17.us.us.us.lcssa.2, %sh_prom
  %conv19.us.us.us.2 = trunc i64 %shr18.us.us.us.2 to i16
  %arrayidx22.us.us.us.2 = getelementptr i16, ptr %1, i32 %inc24.us.us.us.1
  store i16 %conv19.us.us.us.2, ptr %arrayidx22.us.us.us.2, align 2, !tbaa !6
  %inc24.us.us.us.2 = or disjoint i32 %j.047.us.us.us, 3
  %exitcond61.not.2 = icmp eq i32 %inc24.us.us.us.2, %k
  br i1 %exitcond61.not.2, label %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us, label %for.body4.us.us.us.3, !llvm.loop !14

for.body4.us.us.us.3:                             ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.2
  %invariant.gep.us.us.us.3 = getelementptr i16, ptr %B, i32 %inc24.us.us.us.2
  br label %for.body9.us.us.us.3110

for.body9.us.us.us.3110:                          ; preds = %for.body9.us.us.us.3.3, %for.body4.us.us.us.3
  %s.045.us.us.us.3 = phi i32 [ 0, %for.body4.us.us.us.3 ], [ %inc.us.us.us.3.3, %for.body9.us.us.us.3.3 ]
  %acc.044.us.us.us.3 = phi i64 [ %conv, %for.body4.us.us.us.3 ], [ %add17.us.us.us.3.3, %for.body9.us.us.us.3.3 ]
  %arrayidx.us.us.us.3100 = getelementptr i16, ptr %0, i32 %s.045.us.us.us.3
  %26 = load i16, ptr %arrayidx.us.us.us.3100, align 2, !tbaa !6
  %conv10.us.us.us.3101 = sext i16 %26 to i32
  %mul11.us.us.us.3102 = mul nuw nsw i32 %s.045.us.us.us.3, %k
  %gep.us.us.us.3103 = getelementptr i16, ptr %invariant.gep.us.us.us.3, i32 %mul11.us.us.us.3102
  %27 = load i16, ptr %gep.us.us.us.3103, align 2, !tbaa !6
  %conv14.us.us.us.3104 = sext i16 %27 to i32
  %mul15.us.us.us.3105 = mul nsw i32 %conv14.us.us.us.3104, %conv10.us.us.us.3101
  %conv16.us.us.us.3106 = sext i32 %mul15.us.us.us.3105 to i64
  %add17.us.us.us.3107 = add nsw i64 %acc.044.us.us.us.3, %conv16.us.us.us.3106
  %inc.us.us.us.3108 = or disjoint i32 %s.045.us.us.us.3, 1
  %exitcond60.not.3109 = icmp eq i32 %inc.us.us.us.3108, %n
  br i1 %exitcond60.not.3109, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.3, label %for.body9.us.us.us.1.3, !llvm.loop !10

for.body9.us.us.us.1.3:                           ; preds = %for.body9.us.us.us.3110
  %arrayidx.us.us.us.1.3 = getelementptr i16, ptr %0, i32 %inc.us.us.us.3108
  %28 = load i16, ptr %arrayidx.us.us.us.1.3, align 2, !tbaa !6
  %conv10.us.us.us.1.3 = sext i16 %28 to i32
  %mul11.us.us.us.1.3 = mul nuw nsw i32 %inc.us.us.us.3108, %k
  %gep.us.us.us.1.3 = getelementptr i16, ptr %invariant.gep.us.us.us.3, i32 %mul11.us.us.us.1.3
  %29 = load i16, ptr %gep.us.us.us.1.3, align 2, !tbaa !6
  %conv14.us.us.us.1.3 = sext i16 %29 to i32
  %mul15.us.us.us.1.3 = mul nsw i32 %conv14.us.us.us.1.3, %conv10.us.us.us.1.3
  %conv16.us.us.us.1.3 = sext i32 %mul15.us.us.us.1.3 to i64
  %add17.us.us.us.1.3 = add nsw i64 %add17.us.us.us.3107, %conv16.us.us.us.1.3
  %inc.us.us.us.1.3 = or disjoint i32 %s.045.us.us.us.3, 2
  %exitcond60.not.1.3 = icmp eq i32 %inc.us.us.us.1.3, %n
  br i1 %exitcond60.not.1.3, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.3, label %for.body9.us.us.us.2.3, !llvm.loop !10

for.body9.us.us.us.2.3:                           ; preds = %for.body9.us.us.us.1.3
  %arrayidx.us.us.us.2.3 = getelementptr i16, ptr %0, i32 %inc.us.us.us.1.3
  %30 = load i16, ptr %arrayidx.us.us.us.2.3, align 2, !tbaa !6
  %conv10.us.us.us.2.3 = sext i16 %30 to i32
  %mul11.us.us.us.2.3 = mul nuw nsw i32 %inc.us.us.us.1.3, %k
  %gep.us.us.us.2.3 = getelementptr i16, ptr %invariant.gep.us.us.us.3, i32 %mul11.us.us.us.2.3
  %31 = load i16, ptr %gep.us.us.us.2.3, align 2, !tbaa !6
  %conv14.us.us.us.2.3 = sext i16 %31 to i32
  %mul15.us.us.us.2.3 = mul nsw i32 %conv14.us.us.us.2.3, %conv10.us.us.us.2.3
  %conv16.us.us.us.2.3 = sext i32 %mul15.us.us.us.2.3 to i64
  %add17.us.us.us.2.3 = add nsw i64 %add17.us.us.us.1.3, %conv16.us.us.us.2.3
  %inc.us.us.us.2.3 = or disjoint i32 %s.045.us.us.us.3, 3
  %exitcond60.not.2.3 = icmp eq i32 %inc.us.us.us.2.3, %n
  br i1 %exitcond60.not.2.3, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.3, label %for.body9.us.us.us.3.3, !llvm.loop !10

for.body9.us.us.us.3.3:                           ; preds = %for.body9.us.us.us.2.3
  %arrayidx.us.us.us.3.3 = getelementptr i16, ptr %0, i32 %inc.us.us.us.2.3
  %32 = load i16, ptr %arrayidx.us.us.us.3.3, align 2, !tbaa !6
  %conv10.us.us.us.3.3 = sext i16 %32 to i32
  %mul11.us.us.us.3.3 = mul nuw nsw i32 %inc.us.us.us.2.3, %k
  %gep.us.us.us.3.3 = getelementptr i16, ptr %invariant.gep.us.us.us.3, i32 %mul11.us.us.us.3.3
  %33 = load i16, ptr %gep.us.us.us.3.3, align 2, !tbaa !6
  %conv14.us.us.us.3.3 = sext i16 %33 to i32
  %mul15.us.us.us.3.3 = mul nsw i32 %conv14.us.us.us.3.3, %conv10.us.us.us.3.3
  %conv16.us.us.us.3.3 = sext i32 %mul15.us.us.us.3.3 to i64
  %add17.us.us.us.3.3 = add nsw i64 %add17.us.us.us.2.3, %conv16.us.us.us.3.3
  %inc.us.us.us.3.3 = add nuw nsw i32 %s.045.us.us.us.3, 4
  %exitcond60.not.3.3 = icmp eq i32 %inc.us.us.us.3.3, %n
  br i1 %exitcond60.not.3.3, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.3, label %for.body9.us.us.us.3110, !llvm.loop !12

for.cond5.for.cond.cleanup8_crit_edge.us.us.us.3: ; preds = %for.body9.us.us.us.3.3, %for.body9.us.us.us.2.3, %for.body9.us.us.us.1.3, %for.body9.us.us.us.3110
  %add17.us.us.us.lcssa.3 = phi i64 [ %add17.us.us.us.3107, %for.body9.us.us.us.3110 ], [ %add17.us.us.us.1.3, %for.body9.us.us.us.1.3 ], [ %add17.us.us.us.2.3, %for.body9.us.us.us.2.3 ], [ %add17.us.us.us.3.3, %for.body9.us.us.us.3.3 ]
  %shr18.us.us.us.3 = ashr i64 %add17.us.us.us.lcssa.3, %sh_prom
  %conv19.us.us.us.3 = trunc i64 %shr18.us.us.us.3 to i16
  %arrayidx22.us.us.us.3 = getelementptr i16, ptr %1, i32 %inc24.us.us.us.2
  store i16 %conv19.us.us.us.3, ptr %arrayidx22.us.us.us.3, align 2, !tbaa !6
  %inc24.us.us.us.3 = add nuw nsw i32 %j.047.us.us.us, 4
  %exitcond61.not.3 = icmp eq i32 %inc24.us.us.us.3, %k
  br i1 %exitcond61.not.3, label %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us, label %for.body4.us.us.us, !llvm.loop !15

for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us: ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.3, %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.2, %for.cond5.for.cond.cleanup8_crit_edge.us.us.us.1, %for.cond5.for.cond.cleanup8_crit_edge.us.us.us
  %inc27.us.us = add nuw nsw i32 %i.049.us.us, 1
  %exitcond62.not = icmp eq i32 %inc27.us.us, %m
  br i1 %exitcond62.not, label %for.cond.cleanup.loopexit, label %for.cond1.preheader.us.us, !llvm.loop !16

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.cond.cleanup3_crit_edge.split.us55.3
  %i.049.us = phi i32 [ %inc27.us.3, %for.cond1.for.cond.cleanup3_crit_edge.split.us55.3 ], [ 0, %for.cond1.preheader.us.preheader ]
  %mul20.us = mul nuw nsw i32 %i.049.us, %k
  %34 = getelementptr i16, ptr %C, i32 %mul20.us
  br label %for.body4.us50

for.body4.us50:                                   ; preds = %for.body4.us50.3, %for.cond1.preheader.us
  %j.047.us51 = phi i32 [ 0, %for.cond1.preheader.us ], [ %inc24.us53.3, %for.body4.us50.3 ]
  %arrayidx22.us52 = getelementptr i16, ptr %34, i32 %j.047.us51
  store i16 %conv19, ptr %arrayidx22.us52, align 2, !tbaa !6
  %inc24.us53 = or disjoint i32 %j.047.us51, 1
  %exitcond.not = icmp eq i32 %inc24.us53, %k
  br i1 %exitcond.not, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55, label %for.body4.us50.1, !llvm.loop !14

for.body4.us50.1:                                 ; preds = %for.body4.us50
  %arrayidx22.us52.1 = getelementptr i16, ptr %34, i32 %inc24.us53
  store i16 %conv19, ptr %arrayidx22.us52.1, align 2, !tbaa !6
  %inc24.us53.1 = or disjoint i32 %j.047.us51, 2
  %exitcond.not.1 = icmp eq i32 %inc24.us53.1, %k
  br i1 %exitcond.not.1, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55, label %for.body4.us50.2, !llvm.loop !14

for.body4.us50.2:                                 ; preds = %for.body4.us50.1
  %arrayidx22.us52.2 = getelementptr i16, ptr %34, i32 %inc24.us53.1
  store i16 %conv19, ptr %arrayidx22.us52.2, align 2, !tbaa !6
  %inc24.us53.2 = or disjoint i32 %j.047.us51, 3
  %exitcond.not.2 = icmp eq i32 %inc24.us53.2, %k
  br i1 %exitcond.not.2, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55, label %for.body4.us50.3, !llvm.loop !14

for.body4.us50.3:                                 ; preds = %for.body4.us50.2
  %arrayidx22.us52.3 = getelementptr i16, ptr %34, i32 %inc24.us53.2
  store i16 %conv19, ptr %arrayidx22.us52.3, align 2, !tbaa !6
  %inc24.us53.3 = add nuw nsw i32 %j.047.us51, 4
  %exitcond.not.3 = icmp eq i32 %inc24.us53.3, %k
  br i1 %exitcond.not.3, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55, label %for.body4.us50, !llvm.loop !17

for.cond1.for.cond.cleanup3_crit_edge.split.us55: ; preds = %for.body4.us50.3, %for.body4.us50.2, %for.body4.us50.1, %for.body4.us50
  %inc27.us = or disjoint i32 %i.049.us, 1
  %exitcond59.not = icmp eq i32 %inc27.us, %m
  br i1 %exitcond59.not, label %for.cond.cleanup.loopexit1, label %for.cond1.preheader.us.1, !llvm.loop !16

for.cond1.preheader.us.1:                         ; preds = %for.cond1.for.cond.cleanup3_crit_edge.split.us55
  %mul20.us.1 = mul nuw nsw i32 %inc27.us, %k
  %35 = getelementptr i16, ptr %C, i32 %mul20.us.1
  br label %for.body4.us50.169

for.body4.us50.169:                               ; preds = %for.body4.us50.3.1, %for.cond1.preheader.us.1
  %j.047.us51.1 = phi i32 [ 0, %for.cond1.preheader.us.1 ], [ %inc24.us53.3.1, %for.body4.us50.3.1 ]
  %arrayidx22.us52.166 = getelementptr i16, ptr %35, i32 %j.047.us51.1
  store i16 %conv19, ptr %arrayidx22.us52.166, align 2, !tbaa !6
  %inc24.us53.167 = or disjoint i32 %j.047.us51.1, 1
  %exitcond.not.168 = icmp eq i32 %inc24.us53.167, %k
  br i1 %exitcond.not.168, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.1, label %for.body4.us50.1.1, !llvm.loop !14

for.body4.us50.1.1:                               ; preds = %for.body4.us50.169
  %arrayidx22.us52.1.1 = getelementptr i16, ptr %35, i32 %inc24.us53.167
  store i16 %conv19, ptr %arrayidx22.us52.1.1, align 2, !tbaa !6
  %inc24.us53.1.1 = or disjoint i32 %j.047.us51.1, 2
  %exitcond.not.1.1 = icmp eq i32 %inc24.us53.1.1, %k
  br i1 %exitcond.not.1.1, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.1, label %for.body4.us50.2.1, !llvm.loop !14

for.body4.us50.2.1:                               ; preds = %for.body4.us50.1.1
  %arrayidx22.us52.2.1 = getelementptr i16, ptr %35, i32 %inc24.us53.1.1
  store i16 %conv19, ptr %arrayidx22.us52.2.1, align 2, !tbaa !6
  %inc24.us53.2.1 = or disjoint i32 %j.047.us51.1, 3
  %exitcond.not.2.1 = icmp eq i32 %inc24.us53.2.1, %k
  br i1 %exitcond.not.2.1, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.1, label %for.body4.us50.3.1, !llvm.loop !14

for.body4.us50.3.1:                               ; preds = %for.body4.us50.2.1
  %arrayidx22.us52.3.1 = getelementptr i16, ptr %35, i32 %inc24.us53.2.1
  store i16 %conv19, ptr %arrayidx22.us52.3.1, align 2, !tbaa !6
  %inc24.us53.3.1 = add nuw nsw i32 %j.047.us51.1, 4
  %exitcond.not.3.1 = icmp eq i32 %inc24.us53.3.1, %k
  br i1 %exitcond.not.3.1, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.1, label %for.body4.us50.169, !llvm.loop !17

for.cond1.for.cond.cleanup3_crit_edge.split.us55.1: ; preds = %for.body4.us50.3.1, %for.body4.us50.2.1, %for.body4.us50.1.1, %for.body4.us50.169
  %inc27.us.1 = or disjoint i32 %i.049.us, 2
  %exitcond59.not.1 = icmp eq i32 %inc27.us.1, %m
  br i1 %exitcond59.not.1, label %for.cond.cleanup.loopexit1, label %for.cond1.preheader.us.2, !llvm.loop !16

for.cond1.preheader.us.2:                         ; preds = %for.cond1.for.cond.cleanup3_crit_edge.split.us55.1
  %mul20.us.2 = mul nuw nsw i32 %inc27.us.1, %k
  %36 = getelementptr i16, ptr %C, i32 %mul20.us.2
  br label %for.body4.us50.273

for.body4.us50.273:                               ; preds = %for.body4.us50.3.2, %for.cond1.preheader.us.2
  %j.047.us51.2 = phi i32 [ 0, %for.cond1.preheader.us.2 ], [ %inc24.us53.3.2, %for.body4.us50.3.2 ]
  %arrayidx22.us52.270 = getelementptr i16, ptr %36, i32 %j.047.us51.2
  store i16 %conv19, ptr %arrayidx22.us52.270, align 2, !tbaa !6
  %inc24.us53.271 = or disjoint i32 %j.047.us51.2, 1
  %exitcond.not.272 = icmp eq i32 %inc24.us53.271, %k
  br i1 %exitcond.not.272, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.2, label %for.body4.us50.1.2, !llvm.loop !14

for.body4.us50.1.2:                               ; preds = %for.body4.us50.273
  %arrayidx22.us52.1.2 = getelementptr i16, ptr %36, i32 %inc24.us53.271
  store i16 %conv19, ptr %arrayidx22.us52.1.2, align 2, !tbaa !6
  %inc24.us53.1.2 = or disjoint i32 %j.047.us51.2, 2
  %exitcond.not.1.2 = icmp eq i32 %inc24.us53.1.2, %k
  br i1 %exitcond.not.1.2, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.2, label %for.body4.us50.2.2, !llvm.loop !14

for.body4.us50.2.2:                               ; preds = %for.body4.us50.1.2
  %arrayidx22.us52.2.2 = getelementptr i16, ptr %36, i32 %inc24.us53.1.2
  store i16 %conv19, ptr %arrayidx22.us52.2.2, align 2, !tbaa !6
  %inc24.us53.2.2 = or disjoint i32 %j.047.us51.2, 3
  %exitcond.not.2.2 = icmp eq i32 %inc24.us53.2.2, %k
  br i1 %exitcond.not.2.2, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.2, label %for.body4.us50.3.2, !llvm.loop !14

for.body4.us50.3.2:                               ; preds = %for.body4.us50.2.2
  %arrayidx22.us52.3.2 = getelementptr i16, ptr %36, i32 %inc24.us53.2.2
  store i16 %conv19, ptr %arrayidx22.us52.3.2, align 2, !tbaa !6
  %inc24.us53.3.2 = add nuw nsw i32 %j.047.us51.2, 4
  %exitcond.not.3.2 = icmp eq i32 %inc24.us53.3.2, %k
  br i1 %exitcond.not.3.2, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.2, label %for.body4.us50.273, !llvm.loop !17

for.cond1.for.cond.cleanup3_crit_edge.split.us55.2: ; preds = %for.body4.us50.3.2, %for.body4.us50.2.2, %for.body4.us50.1.2, %for.body4.us50.273
  %inc27.us.2 = or disjoint i32 %i.049.us, 3
  %exitcond59.not.2 = icmp eq i32 %inc27.us.2, %m
  br i1 %exitcond59.not.2, label %for.cond.cleanup.loopexit1, label %for.cond1.preheader.us.3, !llvm.loop !16

for.cond1.preheader.us.3:                         ; preds = %for.cond1.for.cond.cleanup3_crit_edge.split.us55.2
  %mul20.us.3 = mul nuw nsw i32 %inc27.us.2, %k
  %37 = getelementptr i16, ptr %C, i32 %mul20.us.3
  br label %for.body4.us50.377

for.body4.us50.377:                               ; preds = %for.body4.us50.3.3, %for.cond1.preheader.us.3
  %j.047.us51.3 = phi i32 [ 0, %for.cond1.preheader.us.3 ], [ %inc24.us53.3.3, %for.body4.us50.3.3 ]
  %arrayidx22.us52.374 = getelementptr i16, ptr %37, i32 %j.047.us51.3
  store i16 %conv19, ptr %arrayidx22.us52.374, align 2, !tbaa !6
  %inc24.us53.375 = or disjoint i32 %j.047.us51.3, 1
  %exitcond.not.376 = icmp eq i32 %inc24.us53.375, %k
  br i1 %exitcond.not.376, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.3, label %for.body4.us50.1.3, !llvm.loop !14

for.body4.us50.1.3:                               ; preds = %for.body4.us50.377
  %arrayidx22.us52.1.3 = getelementptr i16, ptr %37, i32 %inc24.us53.375
  store i16 %conv19, ptr %arrayidx22.us52.1.3, align 2, !tbaa !6
  %inc24.us53.1.3 = or disjoint i32 %j.047.us51.3, 2
  %exitcond.not.1.3 = icmp eq i32 %inc24.us53.1.3, %k
  br i1 %exitcond.not.1.3, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.3, label %for.body4.us50.2.3, !llvm.loop !14

for.body4.us50.2.3:                               ; preds = %for.body4.us50.1.3
  %arrayidx22.us52.2.3 = getelementptr i16, ptr %37, i32 %inc24.us53.1.3
  store i16 %conv19, ptr %arrayidx22.us52.2.3, align 2, !tbaa !6
  %inc24.us53.2.3 = or disjoint i32 %j.047.us51.3, 3
  %exitcond.not.2.3 = icmp eq i32 %inc24.us53.2.3, %k
  br i1 %exitcond.not.2.3, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.3, label %for.body4.us50.3.3, !llvm.loop !14

for.body4.us50.3.3:                               ; preds = %for.body4.us50.2.3
  %arrayidx22.us52.3.3 = getelementptr i16, ptr %37, i32 %inc24.us53.2.3
  store i16 %conv19, ptr %arrayidx22.us52.3.3, align 2, !tbaa !6
  %inc24.us53.3.3 = add nuw nsw i32 %j.047.us51.3, 4
  %exitcond.not.3.3 = icmp eq i32 %inc24.us53.3.3, %k
  br i1 %exitcond.not.3.3, label %for.cond1.for.cond.cleanup3_crit_edge.split.us55.3, label %for.body4.us50.377, !llvm.loop !17

for.cond1.for.cond.cleanup3_crit_edge.split.us55.3: ; preds = %for.body4.us50.3.3, %for.body4.us50.2.3, %for.body4.us50.1.3, %for.body4.us50.377
  %inc27.us.3 = add nuw nsw i32 %i.049.us, 4
  %exitcond59.not.3 = icmp eq i32 %inc27.us.3, %m
  br i1 %exitcond59.not.3, label %for.cond.cleanup.loopexit1, label %for.cond1.preheader.us, !llvm.loop !18

for.cond.cleanup.loopexit:                        ; preds = %for.cond1.for.cond.cleanup3_crit_edge.split.us.us.us
  br label %for.cond.cleanup

for.cond.cleanup.loopexit1:                       ; preds = %for.cond1.for.cond.cleanup3_crit_edge.split.us55, %for.cond1.for.cond.cleanup3_crit_edge.split.us55.1, %for.cond1.for.cond.cleanup3_crit_edge.split.us55.2, %for.cond1.for.cond.cleanup3_crit_edge.split.us55.3
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit1, %for.cond.cleanup.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret i32 0
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zca,+zmmul,-b,-d,-e,-experimental-p,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqccmp,-experimental-xqcia,-experimental-xqciac,-experimental-xqcibi,-experimental-xqcibm,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqciio,-experimental-xqcilb,-experimental-xqcili,-experimental-xqcilia,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisim,-experimental-xqcisls,-experimental-xqcisync,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xespdsp,-xesploop,-xespv,-xespv1v,-xmipscbop,-xmipscmov,-xmipslsp,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0"}
!4 = !{i32 8, !"SmallDataLimit", i32 0}
!5 = !{!"Espressif clang version 21.1.3 (https://gitlab.espressif.cn:6688/idf/llvm-project.git llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-179-g5aa2bd8 llvmorg-21.1.3-188-gc36c18e llvmorg-21.1.3-227-g8a67748 llvmorg-21.1.3-229-g89ce990 llvmorg-21.1.3-229-g89ce990 llvmorg-21.1.3-229-g89ce990 llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-266-gb4ffde0 llvmorg-21.1.3-185-g75b202d llvmorg-21.1.3-185-gc679ef0 llvmorg-21.1.3-185-g12b95fb llvmorg-22-init-16633-gda6e30a llvmorg-21.1.3-177-g8d24c08 llvmorg-21.1.3-269-gd76860a llvmorg-21.1.3-186-g088235d llvmorg-22-init-16649-g2245fca llvmorg-21.1.3-188-gbfc71e5 llvmorg-21.1.3-191-g82e04eb llvmorg-21.1.3-180-g7fe6da0 llvmorg-21.1.3-192-g096086e llvmorg-21.1.3-186-gea5fc2e llvmorg-21.1.3-186-gea5fc2e llvmorg-21.1.3-188-gb27f82a llvmorg-21.1.3-188-gb27f82a llvmorg-22-init-16650-gd0600ba llvmorg-21.1.3-198-ge83ec9d llvmorg-21.1.3-200-g48929d5 llvmorg-21.1.3-202-ga057ba4 llvmorg-21.1.3-203-g766c758 llvmorg-21.1.3-207-g263b50c llvmorg-21.1.3-208-g7775484 llvmorg-21.1.3-210-g6c1b64e llvmorg-21.1.3-177-g96b9175 llvmorg-21.1.3-190-g032c53e llvmorg-21.1.3-211-gb2bf82f llvmorg-21.1.3-211-gb2bf82f llvmorg-21.1.3-212-g505f9f8 llvmorg-21.1.3-190-gb3b6063 llvmorg-21.1.3-190-gb3b6063 llvmorg-21.1.3-217-g424320e llvmorg-21.1.3-190-g72b59b0 llvmorg-21.1.3-221-g0a31504 llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-292-g7d1136b llvmorg-21.1.3-292-g7d1136b llvmorg-21.1.3-298-g1cf535d llvmorg-21.1.3-299-g833c6d3 llvmorg-21.1.3-201-ga3a902d llvmorg-21.1.3-201-ga3a902d llvmorg-21.1.3-302-gb7e6636 llvmorg-21.1.3-200-ga42e229 llvmorg-21.1.3-317-ga68b199 llvmorg-21.1.3-304-gc637cca llvmorg-21.1.3-305-g3bae1b1 llvmorg-21.1.3-308-g377acc3 llvmorg-21.1.3-318-ga1d93c8 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-323-g82cc51e llvmorg-21.1.3-323-g82cc51e llvmorg-21.1.3-323-g82cc51e llvmorg-21.1.3-346-g02fb579 llvmorg-21.1.3-354-g03a9196 llvmorg-21.1.3-354-g03a9196 llvmorg-21.1.3-354-g03a9196 llvmorg-21.1.3-355-g950dd65 llvmorg-21.1.3-356-g13f0270 llvmorg-21.1.3-356-g13f0270 llvmorg-21.1.3-360-g9476fb2 llvmorg-21.1.3-362-g6a1f353 llvmorg-21.1.3-370-g53a6b1d llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-387-g61c8d7b llvmorg-21.1.3-200-gb29938f llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-200-gef9b6cf llvmorg-21.1.3-204-ga35081d llvmorg-21.1.3-204-ga35081d llvmorg-21.1.3-360-g9476fb2 llvmorg-21.1.3-207-g07dbcf1 llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-202-gc98b016 llvmorg-21.1.3-202-gc98b016 llvmorg-21.1.3-204-g5abd691 llvmorg-21.1.3-200-gef9b6cf llvmorg-21.1.3-204-g24a81bc llvmorg-21.1.3-205-gcb1ea3c llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-207-g6cf60db llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-207-g6cf60db llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-207-g6cf60db llvmorg-21.1.3-209-g4564885 llvmorg-21.1.3-200-g390111f llvmorg-21.1.3-210-gbf47968 llvmorg-21.1.3-214-g8da73ab llvmorg-23-init-873-gb2ed772 llvmorg-21.1.3-215-g5bde2d5 llvmorg-21.1.3-215-g5bde2d5 llvmorg-21.1.3-201-g5e0ebf9 llvmorg-21.1.3-201-g5e0ebf9 llvmorg-21.1.3-201-g5e0ebf9 llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-23-init-874-g2b2b286 llvmorg-21.1.3-203-g0876292 llvmorg-21.1.3-204-ge49dcd4 llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-205-g3d62e72 llvmorg-21.1.3-209-g98884cd2 llvmorg-21.1.3-208-ge9b9758 llvmorg-21.1.3-208-ge9b9758 llvmorg-21.1.3-209-gd4f6f02 llvmorg-21.1.3-209-gd4f6f02 llvmorg-21.1.3-202-g064d38e4 llvmorg-21.1.3-203-g237bcfb llvmorg-21.1.3-208-g4efd3e0 llvmorg-21.1.3-209-g385c4df llvmorg-21.1.3-206-gfd4fc97 llvmorg-21.1.3-206-gfd4fc97 llvmorg-21.1.3-215-gd0a8739 llvmorg-21.1.3-203-g7bb5452 llvmorg-21.1.3-224-gaf536de llvmorg-21.1.3-227-g462e152 llvmorg-21.1.3-227-g462e152 llvmorg-21.1.3-205-g51195fb llvmorg-21.1.3-205-g51195fb llvmorg-21.1.3-231-gd9b825b llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-205-g51195fb llvmorg-21.1.3-236-gf442f45 llvmorg-21.1.3-205-g818b51c llvmorg-21.1.3-237-g2520717 llvmorg-21.1.3-237-g2520717 llvmorg-21.1.3-205-ga3d8434 llvmorg-21.1.3-202-g212ba43 llvmorg-21.1.3-244-gfccc4bd llvmorg-21.1.3-244-gfccc4bd llvmorg-21.1.3-244-gfccc4bd llvmorg-21.1.3-204-g8e12c16 llvmorg-21.1.3-245-g486954e llvmorg-21.1.3-247-g3356017 llvmorg-21.1.3-247-g3356017 llvmorg-21.1.3-247-g3356017 llvmorg-21.1.3-204-gd8ccfbf llvmorg-21.1.3-204-gd8ccfbf llvmorg-21.1.3-206-g8a6b0f4 llvmorg-21.1.3-247-g3356017 esp-20.1.1_20250829-7-g5b19fa9 llvmorg-21.1.3-248-g2985eac llvmorg-21.1.3-253-g708c931 llvmorg-21.1.3-253-g708c931 llvmorg-21.1.3-205-gf5d1d66 llvmorg-21.1.3-259-g017fca8 llvmorg-21.1.3-259-g017fca8 llvmorg-21.1.3-263-gbd8ceb3 llvmorg-21.1.3-177-g288ae75 llvmorg-21.1.3-177-g288ae75 llvmorg-21.1.3-267-g4742d6b esp-20.1.1_20250829-534-g61fcea1 esp-19.1.2_20250312-2-g1377683 llvmorg-21.1.3-268-g103601b llvmorg-21.1.3-270-g0aa419e llvmorg-21.1.3-274-g28fc492 llvmorg-21.1.3-271-g4a5c6f8 llvmorg-21.1.3-273-g159687f llvmorg-21.1.3-209-g0522788 llvmorg-21.1.3-277-g2aa024b llvmorg-21.1.3-208-gbc695ce llvmorg-21.1.3-277-g2aa024b llvmorg-21.1.3-278-g398925d llvmorg-21.1.3-281-ge48b86a llvmorg-21.1.3-208-g87c823c llvmorg-21.1.3-285-g41534e8 llvmorg-21.1.3-285-g41534e8 llvmorg-21.1.3-175-ga93634c llvmorg-21.1.3-287-ga2c2af0 llvmorg-21.1.3-287-ga2c2af0 llvmorg-21.1.3-175-ga93634c llvmorg-21.1.3-287-ga2c2af0 llvmorg-21.1.3-289-gcafe761 llvmorg-21.1.3-289-gcafe761 llvmorg-21.1.3-175-ga93634c llvmorg-21.1.3-289-gcafe761 llvmorg-21.1.3-210-g0fc3a02 llvmorg-21.1.3-177-gd863738 llvmorg-21.1.3-293-g34e1eb3 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-293-g34e1eb3 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-294-g5a65faf llvmorg-21.1.3-294-g5a65faf llvmorg-21.1.3-217-gbda73dc llvmorg-21.1.3-295-g3274443 llvmorg-21.1.3-296-g59b63e4 llvmorg-21.1.3-296-g59b63e4 llvmorg-21.1.3-217-ge81d483 llvmorg-21.1.3-301-gb5c4e08 llvmorg-21.1.3-307-gb7c95d0 llvmorg-21.1.3-216-g8d80e641 llvmorg-21.1.3-307-gb7c95d0 llvmorg-21.1.3-308-gcb5c04d llvmorg-21.1.3-310-gd7f7e54 llvmorg-21.1.3-312-gf696352 llvmorg-21.1.3-315-g84a4eb3 llvmorg-21.1.3-316-g06f1007 llvmorg-21.1.3-318-gb817da7)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11, !13}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11, !13}
!18 = distinct !{!18, !11, !13}
