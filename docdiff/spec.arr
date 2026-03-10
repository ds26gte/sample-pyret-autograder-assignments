use context autograder-spec
provide: spec end

include graders

fun build-graders(path :: String):
  [list:
    mk-well-formed("wf", empty, path),
    mk-training-wheels("tw", [list: "wf"], path, false),
    mk-fn-def("docdiff-def", [list: "tw"], path, "overlap", 2),
    mk-self-test("docdiff-self-test", [list: "docdiff-def"], path, "overlap", 1),
    mk-test-diversity("docdiff-diversity", [list: "docdiff-def"], path, "overlap", 2, 2),
    mk-functional("docdiff-functional", [list: "docdiff-def"], path, "functionality.arr", "docdiff: functionality", 4, some("overlap")),
    mk-wheat("docdiff-wheat-1", [list: "docdiff-diversity"], path, "docdiff/wheat-1.arr", "overlap", 1),

    mk-chaff("docdiff-chaff-1", [list: "docdiff-diversity"], path, "docdiff/chaff-1.arr", "overlap", 1),
    ]
end

spec = build-graders("submission/assignment.arr")
