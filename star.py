from copy import deepcopy
import sys


def zero_column(matrix, column_index):
    for i in range(len(matrix)):
        matrix[i][column_index] = 0

def add_one(vec):
    for i in range(len(vec)):
        vec[i] += 1



if __name__ == "__main__":
    star = [[0, 0, 0, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 1, 0], [0, 1, 0, 0, 0, 0, 0, 0, 0, 1], [0, 0, 1, 0, 0, 0, 0, 1, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 1, 0], [0, 1, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0, 0]]
    aux_matrix = deepcopy(star)

    result_vec = []

    n = int(sys.argv[1])
    print("encontrando solucao para estrela partindo da posicao: ", n)
    n -= 1


    while(len(result_vec) < 9):
        result_vec.append(n)
        zero_column(aux_matrix, n)
        n = aux_matrix[n].index(1)

    add_one(result_vec)
    print("solucao", result_vec)
