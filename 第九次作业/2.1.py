def count_occ(input_list):
    output_dict = {}
    for i in input_list:
        if i in output_dict:
            output_dict[i] = output_dict[i] + 1
        else:
            output_dict[i] = 1
    return output_dict


a = ['a', 'b', 'a', 'c', 'd', 'b', 'c']
result = count_occ(a)
print(result)

