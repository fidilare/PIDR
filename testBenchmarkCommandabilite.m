clear

disp('       TEST DES BENCHMARK :')
disp('       BENCHMARK 1 : benchmark_1_graph_2_nodes')
benchmark_1_graph_2_nodes;
couplageCompletCommand('x0',list);
disp('-----------------------------------------------------')


disp('       BENCHMARK 2 : benchmark_2_graph_2_nodes_2_out')
benchmark_2_graph_2_nodes_2_out;
couplageCompletCommand('x0',list);
disp('-----------------------------------------------------')
disp('')


disp('       BENCHMARK 3 : benchmark_1_graph_3_nodes_1_in_1_out')
benchmark_1_graph_3_nodes_1_in_1_out;
couplageCompletCommand('x0',list);
disp('-----------------------------------------------------')
disp('')


disp('       BENCHMARK 4 : benchmark_3_graph_2_nodes_3_in_3_out')
benchmark_3_graph_2_nodes_3_in_3_out;
couplageCompletCommand('x0',list);
disp('-----------------------------------------------------')
disp('')




disp('       BENCHMARK 5 : benchmark_4_graph_2_nodes_4_out')
benchmark_4_graph_2_nodes_4_out;
couplageCompletCommand('x0',list);
disp('-----------------------------------------------------')
disp('')



disp('       BENCHMARK 6 : benchmark_4_graph_3_nodes_4_in_4_out_no_cycles')
benchmark_4_graph_3_nodes_4_in_4_out_no_cycles;
couplageCompletCommand('x0',list);
disp('-----------------------------------------------------')
disp('')
