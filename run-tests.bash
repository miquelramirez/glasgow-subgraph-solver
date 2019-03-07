#!/bin/bash -x

if ! grep '^status = true$' <(./glasgow_subgraph_solver --format lad test-instances/{small,large} ) ; then
    echo "non-induced test failed" 1>&1
    exit 1
fi

if ! grep '^status = false$' <(./glasgow_subgraph_solver --induced --format lad test-instances/{small,large} ) ; then
    echo "induced test failed" 1>&1
    exit 1
fi

if ! grep '^solution_count = 6$' <(./glasgow_subgraph_solver --enumerate --format lad test-instances/{small,large} ) ; then
    echo "non-induced enumerate test failed" 1>&1
    exit 1
fi

if ! grep '^solution_count = 12$' <(./glasgow_subgraph_solver --enumerate test-instances/{trident,longtrident}.csv ) ; then
    echo "trident enumerate test failed" 1>&1
    exit 1
fi

if ! grep '^solution_count = 6$' <(./glasgow_subgraph_solver --enumerate --induced test-instances/{c3,c3c2}.csv ) ; then
    echo "induced cyclic enumerate test failed" 1>&1
    exit 1
fi

true

