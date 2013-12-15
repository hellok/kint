; ModuleID = '<stdin>'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"\0A%d\0A\00", align 1

; Function Attrs: nounwind
define i32 @adds32(i32 %x, i32 %y) #0 {
entry:
  %add = add nsw i32 %x, %y, !dbg !23
  ret i32 %add, !dbg !23
}

; Function Attrs: nounwind
define i64 @addu64(i64 %x, i64 %y) #0 {
entry:
  %add = add i64 %x, %y, !dbg !24
  ret i64 %add, !dbg !24
}

; Function Attrs: nounwind
define i32 @mul2(i32 %x) #0 {
entry:
  %cmp = icmp ult i32 %x, -2, !dbg !25
  br i1 %cmp, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %mul = mul i32 %x, 2, !dbg !27
  br label %return, !dbg !27

if.else:                                          ; preds = %entry
  br label %return, !dbg !28

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %mul, %if.then ], [ 0, %if.else ]
  ret i32 %retval.0, !dbg !29
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %x, align 4, !dbg !30
  store i32 0, i32* %y, align 4, !dbg !30
  %call = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32* %x, i32* %y), !dbg !31
  %0 = load i32* %x, align 4, !dbg !32
  %1 = load i32* %y, align 4, !dbg !32
  %call1 = call i32 @adds32(i32 %0, i32 %1), !dbg !32
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %call1), !dbg !33
  ret i32 0, !dbg !34
}

declare i32 @__isoc99_scanf(i8*, ...) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5 (trunk 196110) (llvm/trunk 196109)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/hellok/kint/demo/1.c] [DW_LANG_C99]
!1 = metadata !{metadata !"1.c", metadata !"/home/hellok/kint/demo"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !13, metadata !17}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"adds32", metadata !"adds32", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @adds32, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 4] [adds32]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/hellok/kint/demo/1.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"addu64", metadata !"addu64", metadata !"", i32 10, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64)* @addu64, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 10] [def] [scope 11] [addu64]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !12, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 32, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mul2", metadata !"mul2", metadata !"", i32 17, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @mul2, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [mul2]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !16, metadata !16}
!16 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 25, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 26} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [main]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !8}
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!21 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"clang version 3.5 (trunk 196110) (llvm/trunk 196109)"}
!23 = metadata !{i32 7, i32 0, metadata !4, null}
!24 = metadata !{i32 14, i32 0, metadata !9, null}
!25 = metadata !{i32 19, i32 0, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !13, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/hellok/kint/demo/1.c]
!27 = metadata !{i32 20, i32 0, metadata !26, null}
!28 = metadata !{i32 22, i32 0, metadata !26, null}
!29 = metadata !{i32 23, i32 0, metadata !13, null}
!30 = metadata !{i32 27, i32 0, metadata !17, null}
!31 = metadata !{i32 29, i32 0, metadata !17, null}
!32 = metadata !{i32 30, i32 0, metadata !17, null}
!33 = metadata !{i32 31, i32 0, metadata !17, null}
!34 = metadata !{i32 32, i32 0, metadata !17, null}
