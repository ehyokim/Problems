import networkx as nx
import numpy as np
from random import random

def main():
    g = nx.karate_club_graph()
    adj_mat = nx.adjacency_matrix(g).todense()

    #print(adj_mat)
    row_sum = (np.sum(adj_mat,0).tolist())[0]
    for ind,sum in enumerate(row_sum):
        adj_mat[ind,ind] = sum
    #print(adj_mat)
    degree_matrix = np.zeros([34,34])

    loop_row_sum = (np.sum(adj_mat,0).tolist())[0]
    for ind,sum in enumerate(loop_row_sum):
        degree_matrix[ind,ind] = sum
    inverse_sqrt = np.copy(degree_matrix)
    inverse_sqrt = np.sqrt(inverse_sqrt)


    for ind in range(34):
        inverse_sqrt[ind,ind] = 1 / inverse_sqrt[ind,ind]
    n_mat = inverse_sqrt * adj_mat * inverse_sqrt

    eigval,eigvec = np.linalg.eig(n_mat)
    eig_ind, second_eigval = sorted(enumerate(eigval),key=lambda x: x[1],reverse=True)[1]
    sec_eigvec = eigvec[:,eig_ind]
    #print(sec_eigvec)
    vertex_list = zip(sec_eigvec.T.tolist()[0],range(34))
    #print(sec_eigvec.T.tolist()[0])
    sorted_ver_list = [x[1] for x in sorted(vertex_list,key=lambda x: x[0],reverse=True)]
    print(sorted_ver_list)

    #tot_edges = np.sum(adj_mat)
    #print(tot_edges)

    conduct_val = []
    for ind in range(33):
        cut_vertex = sorted_ver_list[:ind+1]
        comple_vertex = sorted_ver_list[ind+1:]
        conduct_val.append(compute_condut(cut_vertex,comple_vertex,degree_matrix,adj_mat))

    min_conduct = min(conduct_val)

    print(min_conduct)

    print((min_conduct**2/16),1-second_eigval,min_conduct)


    conduct_trial = []
    for _ in range(10):
        #random cut shits
        cut = []
        comple_cut = []
        for ver in range(34):
            if(random() < 0.5):
                cut.append(ver)
            else:
                comple_cut.append(ver)
        conduct_trial.append(compute_condut(cut,comple_cut,degree_matrix,adj_mat))

    print(np.mean(conduct_trial))

def compute_condut(cut, comple_cut, deg_matrix, adj_mat):
    cut_degree = 0
    for cut_ind in cut:
        cut_degree += deg_matrix[cut_ind, cut_ind]

    comple_cut_degree = 0
    for comple_cut_ind in comple_cut:
        comple_cut_degree += deg_matrix[comple_cut_ind, comple_cut_ind]

    delta = 0

    for cut_ind in cut:
        for comple_ind in comple_cut:
            if adj_mat[cut_ind, comple_ind] == 1:
                delta += 1

    #print(delta,cut_degree,comple_cut_degree)

    conduct = 312*delta/(cut_degree * comple_cut_degree)
    return conduct


if __name__ == "__main__":
    main()
