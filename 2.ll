; ModuleID = '1.ll'
source_filename = "test_progama_assume.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@x = dso_local local_unnamed_addr global [32 x [256 x float]] zeroinitializer, align 4
@h = dso_local local_unnamed_addr global [64 x [256 x float]] zeroinitializer, align 4
@y = dso_local local_unnamed_addr global [32 x [64 x float]] zeroinitializer, align 4
@acc = dso_local local_unnamed_addr global [32 x [64 x float]] zeroinitializer, align 4

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: write)
define dso_local void @loop_original(i32 noundef %m, i32 noundef %k, i32 noundef %n) local_unnamed_addr #0 {
entry:
  %0 = and i32 %k, 3
  %cmp = icmp eq i32 %0, 0
  tail call void @llvm.assume(i1 %cmp)
  %1 = and i32 %n, 3
  %cmp2 = icmp eq i32 %1, 0
  tail call void @llvm.assume(i1 %cmp2)
  %cmp334 = icmp sgt i32 %m, 0
  %cmp532 = icmp sgt i32 %k, 0
  %or.cond = and i1 %cmp334, %cmp532
  br i1 %or.cond, label %for.cond4.preheader.lr.ph.split.us, label %for.cond.cleanup

for.cond4.preheader.lr.ph.split.us:               ; preds = %entry
  %cmp930 = icmp sgt i32 %n, 0
  br i1 %cmp930, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph.split.us
  br label %for.cond4.preheader.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond4.preheader.lr.ph.split.us
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.cond.cleanup6_crit_edge.split.us.us.us
  %i.035.us.us = phi i32 [ %inc16.us.us, %for.cond4.for.cond.cleanup6_crit_edge.split.us.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  br label %for.cond8.preheader.us.us.us

for.cond8.preheader.us.us.us:                     ; preds = %for.cond8.for.cond.cleanup10_crit_edge.us.us.us.3, %for.cond4.preheader.us.us
  %j.033.us.us.us = phi i32 [ 0, %for.cond4.preheader.us.us ], [ %inc13.us.us.us.3, %for.cond8.for.cond.cleanup10_crit_edge.us.us.us.3 ]
  %arrayidx5.i.us.us.us = getelementptr inbounds nuw [32 x [64 x float]], ptr @acc, i32 0, i32 %i.035.us.us, i32 %j.033.us.us.us
  %arrayidx5.i.promoted.us.us.us = load float, ptr %arrayidx5.i.us.us.us, align 4, !tbaa !6
  %arrayidx3.i29.us.us.us = getelementptr inbounds nuw [32 x [64 x float]], ptr @y, i32 0, i32 %i.035.us.us, i32 %j.033.us.us.us
  store float 0.000000e+00, ptr %arrayidx5.i.us.us.us, align 4, !tbaa !6
  %inc13.us.us.us = or disjoint i32 %j.033.us.us.us, 1
  %arrayidx5.i.us.us.us.1 = getelementptr inbounds nuw [32 x [64 x float]], ptr @acc, i32 0, i32 %i.035.us.us, i32 %inc13.us.us.us
  %arrayidx5.i.promoted.us.us.us.1 = load float, ptr %arrayidx5.i.us.us.us.1, align 4, !tbaa !6
  %arrayidx3.i29.us.us.us.1 = getelementptr inbounds nuw [32 x [64 x float]], ptr @y, i32 0, i32 %i.035.us.us, i32 %inc13.us.us.us
  store float 0.000000e+00, ptr %arrayidx5.i.us.us.us.1, align 4, !tbaa !6
  %inc13.us.us.us.1 = or disjoint i32 %j.033.us.us.us, 2
  %arrayidx5.i.us.us.us.2 = getelementptr inbounds nuw [32 x [64 x float]], ptr @acc, i32 0, i32 %i.035.us.us, i32 %inc13.us.us.us.1
  %arrayidx5.i.promoted.us.us.us.2 = load float, ptr %arrayidx5.i.us.us.us.2, align 4, !tbaa !6
  %arrayidx3.i29.us.us.us.2 = getelementptr inbounds nuw [32 x [64 x float]], ptr @y, i32 0, i32 %i.035.us.us, i32 %inc13.us.us.us.1
  store float 0.000000e+00, ptr %arrayidx5.i.us.us.us.2, align 4, !tbaa !6
  %inc13.us.us.us.2 = or disjoint i32 %j.033.us.us.us, 3
  %arrayidx5.i.us.us.us.3 = getelementptr inbounds nuw [32 x [64 x float]], ptr @acc, i32 0, i32 %i.035.us.us, i32 %inc13.us.us.us.2
  %arrayidx5.i.promoted.us.us.us.3 = load float, ptr %arrayidx5.i.us.us.us.3, align 4, !tbaa !6
  br label %for.body11.us.us.us

for.body11.us.us.us:                              ; preds = %for.body11.us.us.us, %for.cond8.preheader.us.us.us
  %2 = phi float [ %arrayidx5.i.promoted.us.us.us, %for.cond8.preheader.us.us.us ], [ %17, %for.body11.us.us.us ]
  %s.031.us.us.us = phi i32 [ 0, %for.cond8.preheader.us.us.us ], [ %inc.us.us.us.3, %for.body11.us.us.us ]
  %3 = phi float [ %arrayidx5.i.promoted.us.us.us.1, %for.cond8.preheader.us.us.us ], [ %29, %for.body11.us.us.us ]
  %s.031.us.us.us.1 = phi i32 [ 0, %for.cond8.preheader.us.us.us ], [ %inc.us.us.us.3.1, %for.body11.us.us.us ]
  %4 = phi float [ %arrayidx5.i.promoted.us.us.us.2, %for.cond8.preheader.us.us.us ], [ %41, %for.body11.us.us.us ]
  %s.031.us.us.us.2 = phi i32 [ 0, %for.cond8.preheader.us.us.us ], [ %inc.us.us.us.3.2, %for.body11.us.us.us ]
  %5 = phi float [ %arrayidx5.i.promoted.us.us.us.3, %for.cond8.preheader.us.us.us ], [ %53, %for.body11.us.us.us ]
  %s.031.us.us.us.3 = phi i32 [ 0, %for.cond8.preheader.us.us.us ], [ %inc.us.us.us.3.3, %for.body11.us.us.us ]
  %arrayidx1.i.us.us.us = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %s.031.us.us.us
  %6 = load float, ptr %arrayidx1.i.us.us.us, align 4, !tbaa !6
  %arrayidx3.i.us.us.us = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %j.033.us.us.us, i32 %s.031.us.us.us
  %7 = load float, ptr %arrayidx3.i.us.us.us, align 4, !tbaa !6
  %8 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %2)
  %inc.us.us.us = or disjoint i32 %s.031.us.us.us, 1
  %arrayidx1.i.us.us.us.1 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us
  %9 = load float, ptr %arrayidx1.i.us.us.us.1, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.1 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %j.033.us.us.us, i32 %inc.us.us.us
  %10 = load float, ptr %arrayidx3.i.us.us.us.1, align 4, !tbaa !6
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %8)
  %inc.us.us.us.1 = or disjoint i32 %s.031.us.us.us, 2
  %arrayidx1.i.us.us.us.2 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.1
  %12 = load float, ptr %arrayidx1.i.us.us.us.2, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.2 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %j.033.us.us.us, i32 %inc.us.us.us.1
  %13 = load float, ptr %arrayidx3.i.us.us.us.2, align 4, !tbaa !6
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %11)
  %inc.us.us.us.2 = or disjoint i32 %s.031.us.us.us, 3
  %arrayidx1.i.us.us.us.3 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.2
  %15 = load float, ptr %arrayidx1.i.us.us.us.3, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.3 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %j.033.us.us.us, i32 %inc.us.us.us.2
  %16 = load float, ptr %arrayidx3.i.us.us.us.3, align 4, !tbaa !6
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %14)
  %inc.us.us.us.3 = add nuw nsw i32 %s.031.us.us.us, 4
  %exitcond49.not.3 = icmp eq i32 %inc.us.us.us.3, %n
  %arrayidx1.i.us.us.us.155 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %s.031.us.us.us.1
  %18 = load float, ptr %arrayidx1.i.us.us.us.155, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.156 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us, i32 %s.031.us.us.us.1
  %19 = load float, ptr %arrayidx3.i.us.us.us.156, align 4, !tbaa !6
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %3)
  %inc.us.us.us.157 = or disjoint i32 %s.031.us.us.us.1, 1
  %arrayidx1.i.us.us.us.1.1 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.157
  %21 = load float, ptr %arrayidx1.i.us.us.us.1.1, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.1.1 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us, i32 %inc.us.us.us.157
  %22 = load float, ptr %arrayidx3.i.us.us.us.1.1, align 4, !tbaa !6
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %20)
  %inc.us.us.us.1.1 = or disjoint i32 %s.031.us.us.us.1, 2
  %arrayidx1.i.us.us.us.2.1 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.1.1
  %24 = load float, ptr %arrayidx1.i.us.us.us.2.1, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.2.1 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us, i32 %inc.us.us.us.1.1
  %25 = load float, ptr %arrayidx3.i.us.us.us.2.1, align 4, !tbaa !6
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %23)
  %inc.us.us.us.2.1 = or disjoint i32 %s.031.us.us.us.1, 3
  %arrayidx1.i.us.us.us.3.1 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.2.1
  %27 = load float, ptr %arrayidx1.i.us.us.us.3.1, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.3.1 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us, i32 %inc.us.us.us.2.1
  %28 = load float, ptr %arrayidx3.i.us.us.us.3.1, align 4, !tbaa !6
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %26)
  %inc.us.us.us.3.1 = add nuw nsw i32 %s.031.us.us.us.1, 4
  %exitcond49.not.3.1 = icmp eq i32 %inc.us.us.us.3.1, %n
  %arrayidx1.i.us.us.us.258 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %s.031.us.us.us.2
  %30 = load float, ptr %arrayidx1.i.us.us.us.258, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.259 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us.1, i32 %s.031.us.us.us.2
  %31 = load float, ptr %arrayidx3.i.us.us.us.259, align 4, !tbaa !6
  %32 = tail call float @llvm.fmuladd.f32(float %30, float %31, float %4)
  %inc.us.us.us.260 = or disjoint i32 %s.031.us.us.us.2, 1
  %arrayidx1.i.us.us.us.1.2 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.260
  %33 = load float, ptr %arrayidx1.i.us.us.us.1.2, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.1.2 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us.1, i32 %inc.us.us.us.260
  %34 = load float, ptr %arrayidx3.i.us.us.us.1.2, align 4, !tbaa !6
  %35 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %32)
  %inc.us.us.us.1.2 = or disjoint i32 %s.031.us.us.us.2, 2
  %arrayidx1.i.us.us.us.2.2 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.1.2
  %36 = load float, ptr %arrayidx1.i.us.us.us.2.2, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.2.2 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us.1, i32 %inc.us.us.us.1.2
  %37 = load float, ptr %arrayidx3.i.us.us.us.2.2, align 4, !tbaa !6
  %38 = tail call float @llvm.fmuladd.f32(float %36, float %37, float %35)
  %inc.us.us.us.2.2 = or disjoint i32 %s.031.us.us.us.2, 3
  %arrayidx1.i.us.us.us.3.2 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.2.2
  %39 = load float, ptr %arrayidx1.i.us.us.us.3.2, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.3.2 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us.1, i32 %inc.us.us.us.2.2
  %40 = load float, ptr %arrayidx3.i.us.us.us.3.2, align 4, !tbaa !6
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %38)
  %inc.us.us.us.3.2 = add nuw nsw i32 %s.031.us.us.us.2, 4
  %exitcond49.not.3.2 = icmp eq i32 %inc.us.us.us.3.2, %n
  %arrayidx1.i.us.us.us.361 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %s.031.us.us.us.3
  %42 = load float, ptr %arrayidx1.i.us.us.us.361, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.362 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us.2, i32 %s.031.us.us.us.3
  %43 = load float, ptr %arrayidx3.i.us.us.us.362, align 4, !tbaa !6
  %44 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %5)
  %inc.us.us.us.363 = or disjoint i32 %s.031.us.us.us.3, 1
  %arrayidx1.i.us.us.us.1.3 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.363
  %45 = load float, ptr %arrayidx1.i.us.us.us.1.3, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.1.3 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us.2, i32 %inc.us.us.us.363
  %46 = load float, ptr %arrayidx3.i.us.us.us.1.3, align 4, !tbaa !6
  %47 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %44)
  %inc.us.us.us.1.3 = or disjoint i32 %s.031.us.us.us.3, 2
  %arrayidx1.i.us.us.us.2.3 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.1.3
  %48 = load float, ptr %arrayidx1.i.us.us.us.2.3, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.2.3 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us.2, i32 %inc.us.us.us.1.3
  %49 = load float, ptr %arrayidx3.i.us.us.us.2.3, align 4, !tbaa !6
  %50 = tail call float @llvm.fmuladd.f32(float %48, float %49, float %47)
  %inc.us.us.us.2.3 = or disjoint i32 %s.031.us.us.us.3, 3
  %arrayidx1.i.us.us.us.3.3 = getelementptr inbounds nuw [32 x [256 x float]], ptr @x, i32 0, i32 %i.035.us.us, i32 %inc.us.us.us.2.3
  %51 = load float, ptr %arrayidx1.i.us.us.us.3.3, align 4, !tbaa !6
  %arrayidx3.i.us.us.us.3.3 = getelementptr inbounds nuw [64 x [256 x float]], ptr @h, i32 0, i32 %inc13.us.us.us.2, i32 %inc.us.us.us.2.3
  %52 = load float, ptr %arrayidx3.i.us.us.us.3.3, align 4, !tbaa !6
  %53 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %50)
  %inc.us.us.us.3.3 = add nuw nsw i32 %s.031.us.us.us.3, 4
  %exitcond49.not.3.3 = icmp eq i32 %inc.us.us.us.3.3, %n
  br i1 %exitcond49.not.3.3, label %for.cond8.for.cond.cleanup10_crit_edge.us.us.us.3, label %for.body11.us.us.us, !llvm.loop !10

for.cond8.for.cond.cleanup10_crit_edge.us.us.us.3: ; preds = %for.body11.us.us.us
  store float %17, ptr %arrayidx3.i29.us.us.us, align 4, !tbaa !6
  store float %29, ptr %arrayidx3.i29.us.us.us.1, align 4, !tbaa !6
  store float %41, ptr %arrayidx3.i29.us.us.us.2, align 4, !tbaa !6
  %arrayidx3.i29.us.us.us.3 = getelementptr inbounds nuw [32 x [64 x float]], ptr @y, i32 0, i32 %i.035.us.us, i32 %inc13.us.us.us.2
  store float %53, ptr %arrayidx3.i29.us.us.us.3, align 4, !tbaa !6
  store float 0.000000e+00, ptr %arrayidx5.i.us.us.us.3, align 4, !tbaa !6
  %inc13.us.us.us.3 = add nuw nsw i32 %j.033.us.us.us, 4
  %exitcond50.not.3 = icmp eq i32 %inc13.us.us.us.3, %k
  br i1 %exitcond50.not.3, label %for.cond4.for.cond.cleanup6_crit_edge.split.us.us.us, label %for.cond8.preheader.us.us.us, !llvm.loop !13

for.cond4.for.cond.cleanup6_crit_edge.split.us.us.us: ; preds = %for.cond8.for.cond.cleanup10_crit_edge.us.us.us.3
  %inc16.us.us = add nuw nsw i32 %i.035.us.us, 1
  %exitcond51.not = icmp eq i32 %inc16.us.us, %m
  br i1 %exitcond51.not, label %for.cond.cleanup.loopexit, label %for.cond4.preheader.us.us, !llvm.loop !14

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.cond.cleanup6_crit_edge.split.us43
  %i.035.us = phi i32 [ %inc16.us, %for.cond4.for.cond.cleanup6_crit_edge.split.us43 ], [ 0, %for.cond4.preheader.us.preheader ]
  br label %for.cond8.preheader.us37

for.cond8.preheader.us37:                         ; preds = %for.cond8.preheader.us37, %for.cond4.preheader.us
  %j.033.us38 = phi i32 [ 0, %for.cond4.preheader.us ], [ %inc13.us41.3, %for.cond8.preheader.us37 ]
  %arrayidx1.i28.us39 = getelementptr inbounds nuw [32 x [64 x float]], ptr @acc, i32 0, i32 %i.035.us, i32 %j.033.us38
  %54 = load float, ptr %arrayidx1.i28.us39, align 4, !tbaa !6
  %arrayidx3.i29.us40 = getelementptr inbounds nuw [32 x [64 x float]], ptr @y, i32 0, i32 %i.035.us, i32 %j.033.us38
  store float %54, ptr %arrayidx3.i29.us40, align 4, !tbaa !6
  store float 0.000000e+00, ptr %arrayidx1.i28.us39, align 4, !tbaa !6
  %inc13.us41 = or disjoint i32 %j.033.us38, 1
  %arrayidx1.i28.us39.1 = getelementptr inbounds nuw [32 x [64 x float]], ptr @acc, i32 0, i32 %i.035.us, i32 %inc13.us41
  %55 = load float, ptr %arrayidx1.i28.us39.1, align 4, !tbaa !6
  %arrayidx3.i29.us40.1 = getelementptr inbounds nuw [32 x [64 x float]], ptr @y, i32 0, i32 %i.035.us, i32 %inc13.us41
  store float %55, ptr %arrayidx3.i29.us40.1, align 4, !tbaa !6
  store float 0.000000e+00, ptr %arrayidx1.i28.us39.1, align 4, !tbaa !6
  %inc13.us41.1 = or disjoint i32 %j.033.us38, 2
  %arrayidx1.i28.us39.2 = getelementptr inbounds nuw [32 x [64 x float]], ptr @acc, i32 0, i32 %i.035.us, i32 %inc13.us41.1
  %56 = load float, ptr %arrayidx1.i28.us39.2, align 4, !tbaa !6
  %arrayidx3.i29.us40.2 = getelementptr inbounds nuw [32 x [64 x float]], ptr @y, i32 0, i32 %i.035.us, i32 %inc13.us41.1
  store float %56, ptr %arrayidx3.i29.us40.2, align 4, !tbaa !6
  store float 0.000000e+00, ptr %arrayidx1.i28.us39.2, align 4, !tbaa !6
  %inc13.us41.2 = or disjoint i32 %j.033.us38, 3
  %arrayidx1.i28.us39.3 = getelementptr inbounds nuw [32 x [64 x float]], ptr @acc, i32 0, i32 %i.035.us, i32 %inc13.us41.2
  %57 = load float, ptr %arrayidx1.i28.us39.3, align 4, !tbaa !6
  %arrayidx3.i29.us40.3 = getelementptr inbounds nuw [32 x [64 x float]], ptr @y, i32 0, i32 %i.035.us, i32 %inc13.us41.2
  store float %57, ptr %arrayidx3.i29.us40.3, align 4, !tbaa !6
  store float 0.000000e+00, ptr %arrayidx1.i28.us39.3, align 4, !tbaa !6
  %inc13.us41.3 = add nuw nsw i32 %j.033.us38, 4
  %exitcond.not.3 = icmp eq i32 %inc13.us41.3, %k
  br i1 %exitcond.not.3, label %for.cond4.for.cond.cleanup6_crit_edge.split.us43, label %for.cond8.preheader.us37, !llvm.loop !15

for.cond4.for.cond.cleanup6_crit_edge.split.us43: ; preds = %for.cond8.preheader.us37
  %inc16.us = add nuw nsw i32 %i.035.us, 1
  %exitcond48.not = icmp eq i32 %inc16.us, %m
  br i1 %exitcond48.not, label %for.cond.cleanup.loopexit1, label %for.cond4.preheader.us, !llvm.loop !14

for.cond.cleanup.loopexit:                        ; preds = %for.cond4.for.cond.cleanup6_crit_edge.split.us.us.us
  br label %for.cond.cleanup

for.cond.cleanup.loopexit1:                       ; preds = %for.cond4.for.cond.cleanup6_crit_edge.split.us43
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit1, %for.cond.cleanup.loopexit, %entry
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zca,+zmmul,-b,-d,-e,-experimental-p,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqccmp,-experimental-xqcia,-experimental-xqciac,-experimental-xqcibi,-experimental-xqcibm,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqciio,-experimental-xqcilb,-experimental-xqcili,-experimental-xqcilia,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisim,-experimental-xqcisls,-experimental-xqcisync,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xespdsp,-xesploop,-xespv,-xespv1v,-xmipscbop,-xmipscmov,-xmipslsp,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0"}
!4 = !{i32 8, !"SmallDataLimit", i32 0}
!5 = !{!"Espressif clang version 21.1.3 (https://gitlab.espressif.cn:6688/idf/llvm-project.git llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-187-g52809b0 llvmorg-21.1.3-179-g5aa2bd8 llvmorg-21.1.3-188-gc36c18e llvmorg-21.1.3-227-g8a67748 llvmorg-21.1.3-229-g89ce990 llvmorg-21.1.3-229-g89ce990 llvmorg-21.1.3-229-g89ce990 llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-244-g560b11e llvmorg-21.1.3-266-gb4ffde0 llvmorg-21.1.3-185-g75b202d llvmorg-21.1.3-185-gc679ef0 llvmorg-21.1.3-185-g12b95fb llvmorg-22-init-16633-gda6e30a llvmorg-21.1.3-177-g8d24c08 llvmorg-21.1.3-269-gd76860a llvmorg-21.1.3-186-g088235d llvmorg-22-init-16649-g2245fca llvmorg-21.1.3-188-gbfc71e5 llvmorg-21.1.3-191-g82e04eb llvmorg-21.1.3-180-g7fe6da0 llvmorg-21.1.3-192-g096086e llvmorg-21.1.3-186-gea5fc2e llvmorg-21.1.3-186-gea5fc2e llvmorg-21.1.3-188-gb27f82a llvmorg-21.1.3-188-gb27f82a llvmorg-22-init-16650-gd0600ba llvmorg-21.1.3-198-ge83ec9d llvmorg-21.1.3-200-g48929d5 llvmorg-21.1.3-202-ga057ba4 llvmorg-21.1.3-203-g766c758 llvmorg-21.1.3-207-g263b50c llvmorg-21.1.3-208-g7775484 llvmorg-21.1.3-210-g6c1b64e llvmorg-21.1.3-177-g96b9175 llvmorg-21.1.3-190-g032c53e llvmorg-21.1.3-211-gb2bf82f llvmorg-21.1.3-211-gb2bf82f llvmorg-21.1.3-212-g505f9f8 llvmorg-21.1.3-190-gb3b6063 llvmorg-21.1.3-190-gb3b6063 llvmorg-21.1.3-217-g424320e llvmorg-21.1.3-190-g72b59b0 llvmorg-21.1.3-221-g0a31504 llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-292-g7d1136b llvmorg-21.1.3-292-g7d1136b llvmorg-21.1.3-298-g1cf535d llvmorg-21.1.3-299-g833c6d3 llvmorg-21.1.3-201-ga3a902d llvmorg-21.1.3-201-ga3a902d llvmorg-21.1.3-302-gb7e6636 llvmorg-21.1.3-200-ga42e229 llvmorg-21.1.3-317-ga68b199 llvmorg-21.1.3-304-gc637cca llvmorg-21.1.3-305-g3bae1b1 llvmorg-21.1.3-308-g377acc3 llvmorg-21.1.3-318-ga1d93c8 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-319-g5a13e39 llvmorg-21.1.3-323-g82cc51e llvmorg-21.1.3-323-g82cc51e llvmorg-21.1.3-323-g82cc51e llvmorg-21.1.3-346-g02fb579 llvmorg-21.1.3-354-g03a9196 llvmorg-21.1.3-354-g03a9196 llvmorg-21.1.3-354-g03a9196 llvmorg-21.1.3-355-g950dd65 llvmorg-21.1.3-356-g13f0270 llvmorg-21.1.3-356-g13f0270 llvmorg-21.1.3-360-g9476fb2 llvmorg-21.1.3-362-g6a1f353 llvmorg-21.1.3-370-g53a6b1d llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-387-g61c8d7b llvmorg-21.1.3-200-gb29938f llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-200-gef9b6cf llvmorg-21.1.3-204-ga35081d llvmorg-21.1.3-204-ga35081d llvmorg-21.1.3-360-g9476fb2 llvmorg-21.1.3-207-g07dbcf1 llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-202-gc98b016 llvmorg-21.1.3-202-gc98b016 llvmorg-21.1.3-204-g5abd691 llvmorg-21.1.3-200-gef9b6cf llvmorg-21.1.3-204-g24a81bc llvmorg-21.1.3-205-gcb1ea3c llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-207-g6cf60db llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-207-g6cf60db llvmorg-21.1.3-199-g6e296b4 llvmorg-21.1.3-207-g6cf60db llvmorg-21.1.3-209-g4564885 llvmorg-21.1.3-200-g390111f llvmorg-21.1.3-210-gbf47968 llvmorg-21.1.3-214-g8da73ab llvmorg-23-init-873-gb2ed772 llvmorg-21.1.3-215-g5bde2d5 llvmorg-21.1.3-215-g5bde2d5 llvmorg-21.1.3-201-g5e0ebf9 llvmorg-21.1.3-201-g5e0ebf9 llvmorg-21.1.3-201-g5e0ebf9 llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-21.1.3-202-g1cc8b3d llvmorg-23-init-874-g2b2b286 llvmorg-21.1.3-203-g0876292 llvmorg-21.1.3-204-ge49dcd4 llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-204-gb59696e llvmorg-21.1.3-205-g3d62e72 llvmorg-21.1.3-209-g98884cd2 llvmorg-21.1.3-208-ge9b9758 llvmorg-21.1.3-208-ge9b9758 llvmorg-21.1.3-209-gd4f6f02 llvmorg-21.1.3-209-gd4f6f02 llvmorg-21.1.3-202-g064d38e4 llvmorg-21.1.3-203-g237bcfb llvmorg-21.1.3-208-g4efd3e0 llvmorg-21.1.3-209-g385c4df llvmorg-21.1.3-206-gfd4fc97 llvmorg-21.1.3-206-gfd4fc97 llvmorg-21.1.3-215-gd0a8739 llvmorg-21.1.3-203-g7bb5452 llvmorg-21.1.3-224-gaf536de llvmorg-21.1.3-227-g462e152 llvmorg-21.1.3-227-g462e152 llvmorg-21.1.3-205-g51195fb llvmorg-21.1.3-205-g51195fb llvmorg-21.1.3-231-gd9b825b llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-232-gbe84498 llvmorg-21.1.3-205-g51195fb llvmorg-21.1.3-236-gf442f45 llvmorg-21.1.3-205-g818b51c llvmorg-21.1.3-237-g2520717 llvmorg-21.1.3-237-g2520717 llvmorg-21.1.3-205-ga3d8434 llvmorg-21.1.3-202-g212ba43 llvmorg-21.1.3-244-gfccc4bd llvmorg-21.1.3-244-gfccc4bd llvmorg-21.1.3-244-gfccc4bd llvmorg-21.1.3-204-g8e12c16 llvmorg-21.1.3-245-g486954e llvmorg-21.1.3-247-g3356017 llvmorg-21.1.3-247-g3356017 llvmorg-21.1.3-247-g3356017 llvmorg-21.1.3-204-gd8ccfbf llvmorg-21.1.3-204-gd8ccfbf llvmorg-21.1.3-206-g8a6b0f4 llvmorg-21.1.3-247-g3356017 esp-20.1.1_20250829-7-g5b19fa9 llvmorg-21.1.3-248-g2985eac llvmorg-21.1.3-253-g708c931 llvmorg-21.1.3-253-g708c931 llvmorg-21.1.3-205-gf5d1d66 llvmorg-21.1.3-259-g017fca8 llvmorg-21.1.3-259-g017fca8 llvmorg-21.1.3-263-gbd8ceb3 llvmorg-21.1.3-177-g288ae75 llvmorg-21.1.3-177-g288ae75 llvmorg-21.1.3-267-g4742d6b esp-20.1.1_20250829-534-g61fcea1 esp-19.1.2_20250312-2-g1377683 llvmorg-21.1.3-268-g103601b llvmorg-21.1.3-270-g0aa419e llvmorg-21.1.3-274-g28fc492 llvmorg-21.1.3-271-g4a5c6f8 llvmorg-21.1.3-273-g159687f llvmorg-21.1.3-209-g0522788 llvmorg-21.1.3-277-g2aa024b llvmorg-21.1.3-208-gbc695ce llvmorg-21.1.3-277-g2aa024b llvmorg-21.1.3-278-g398925d llvmorg-21.1.3-281-ge48b86a llvmorg-21.1.3-208-g87c823c llvmorg-21.1.3-285-g41534e8 llvmorg-21.1.3-285-g41534e8 llvmorg-21.1.3-175-ga93634c llvmorg-21.1.3-287-ga2c2af0 llvmorg-21.1.3-287-ga2c2af0 llvmorg-21.1.3-175-ga93634c llvmorg-21.1.3-287-ga2c2af0 llvmorg-21.1.3-289-gcafe761 llvmorg-21.1.3-289-gcafe761 llvmorg-21.1.3-175-ga93634c llvmorg-21.1.3-289-gcafe761 llvmorg-21.1.3-210-g0fc3a02 llvmorg-21.1.3-177-gd863738 llvmorg-21.1.3-293-g34e1eb3 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-293-g34e1eb3 llvmorg-21.1.3-219-ga427067 llvmorg-21.1.3-294-g5a65faf llvmorg-21.1.3-294-g5a65faf llvmorg-21.1.3-217-gbda73dc llvmorg-21.1.3-295-g3274443 llvmorg-21.1.3-296-g59b63e4 llvmorg-21.1.3-296-g59b63e4 llvmorg-21.1.3-217-ge81d483 llvmorg-21.1.3-301-gb5c4e08 llvmorg-21.1.3-307-gb7c95d0 llvmorg-21.1.3-216-g8d80e641 llvmorg-21.1.3-307-gb7c95d0 llvmorg-21.1.3-308-gcb5c04d llvmorg-21.1.3-310-gd7f7e54 llvmorg-21.1.3-312-gf696352 llvmorg-21.1.3-315-g84a4eb3 llvmorg-21.1.3-316-g06f1007 llvmorg-21.1.3-318-gb817da7)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !11, !12}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11, !12}
