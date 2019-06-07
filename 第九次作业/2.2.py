def count_occ(input_list):
    output_dict = {}
    for i in input_list:
        count = output_dict.get(i, 0)
        output_dict[i] = count + 1
    return output_dict


a = ['a', 'b', 'a', 'c', 'd', 'b', 'c']
result = count_occ(a)
print(result)

