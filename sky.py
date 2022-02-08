from copy import deepcopy
import sys


def zero_column(matrix, column_index):
    for i in range(len(matrix)):
        matrix[i][column_index] = 0

def add_one(vec):
    for i in range(len(vec)):
        vec[i] += 1

def count_stars(star, n, vec):
    if len(vec) >= 9:
        print(vec)
        return 1
    result_vec = []
    count = 0
    for i in vec:
        result_vec.append(i)

    result_vec.append(n)
    zero_column(star, n)
    index_list = [i for i, n in enumerate(star[n]) if n == 1]
    if (index_list):
        count += count_stars(deepcopy(star), index_list[0], result_vec)
        if len(index_list) > 1:
            count += count_stars(deepcopy(star), index_list[1], result_vec)

    else:
        return count
    
    return count

if __name__ == "__main__":

    star = [[0, 0, 0, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 1, 0], [0, 1, 0, 0, 0, 0, 0, 0, 0, 1], [0, 0, 1, 0, 0, 0, 0, 1, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 1, 0], [0, 1, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 1, 0, 0, 0, 0]]
    count = 0

    for i in range(10):
        aux_matrix = deepcopy(star)
        count += count_stars(aux_matrix, i, [])
    
    print("result", count)
    