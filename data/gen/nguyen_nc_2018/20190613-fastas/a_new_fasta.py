def group_lines(incoming_lines, separator):
    """Break lines into groups using `separator`"""
    # If there are no lines, there should be no groups.
    groups = []
    for line in incoming_lines:
        if not groups or line.startswith(separator):
            # If there are no groups at all yet or we see a line that starts a                                           
            # new group, we add a group to th elist.
            groups.append([])
            #print(groups)
        groups[-1].append(line)
        #print(line)
    return groups


def main():
    with open('chrMchr1-1.fasta.eg') as f:
        groups = group_lines(f, '>')
        print(groups[1])
    for number, group in enumerate(groups):
        outfile = "output_{}.txt".format(number)
        #print("Writing {} lines to {}".format(len(group), outfile))
        #print(len(group[0]))
        with open(outfile, 'w') as out:
            out.writelines(group)
            print(''.join(group))
            
    return 0

if __name__ == '__main__':
    main()



