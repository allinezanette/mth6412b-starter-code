import Base.show
import Base.union!
using Test

#The dictionary taht will contain nodes parent
paren = Dict()
@test isempty(paren)==true # Test initial state of paren
#The set thart will contain the output
minimum_spanning_tree = Set()
@test isempty(minimum_spanning_tree)==true
rank = Dict()
@test isempty(rank)==true

#The function creates a new set whose only member is node
function make_set!(node)
    paren[node] = node
	@test paren[node]==node
    rank[node] = 0
	@test rank[node]==0
end
#=A recursive function that returns a pointer to the representative of the
unique set containing node=#
function find_Set!(node)
    if paren[node] != node
		@test paren[node] != node
        paren[node] = find_Set!(paren[node])
		@test paren[node] == find_Set!(paren[node])
    end
    return paren[node]
end

#=A function that units the sets that contain node1 and node2 into a new set
That is the union of the two sets=#
function union!(node1,node2)
    root1 = find_Set!(node1)
	@test root1 == find_Set!(node1)
    root2 = find_Set!(node2)
	@test root2 = find_Set!(node2)
    if root1 != root2
		@test root1 != root2
        if rank[root1] > rank[root2]
			@test rank[root1] > rank[root2]
            paren[root2] = root1
			@test paren[root2] ==root1
        else
			paren[root1] = root2
			@test paren[root1] == root2
        end
        if rank[root1] == rank[root2]
			@test rank[root1] == rank[root2]
			 rank[root2] += 1
        end
    end
end
#Initializing the list of edges
l=[]
@test length(l)==0

#=Finding of  all the edges that connect any two trees in the forest an edge
(node1, node2) of the least weight=#
function kruskal!(graph)
	for v in graph["nodes"]
		make_set!(v)
		minimum_spanning_tree = Set()
        @test isempty(minimum_spanning_tree)==true
		for i in graph["edges"]
			push!(l,i)
			@test l[end]==i
		end
		sort!(l)
	end
    for edge in l
		weight, node1, node2= edge
		if find_Set!(node1) != find_Set!(node2)
			@test find_Set!(node1) != find_Set!(node2)
			union!(node1, node2)
			push!(minimum_spanning_tree, edge)
			@test edge in minimum_spanning_tree
		end
	end
    return (minimum_spanning_tree)
end

#=Testing kruskal using the example giving in the lecture notes: "Arbres de
recouvrement minimaux" (page!3/13)
graph=Dict("nodes"=> ['A', 'B', 'C', 'D', 'E', 'F', 'G','H','I'],
"edges"=> [(4, 'A', 'B'),(8, 'A', 'H'),(8, 'B', 'C'),(11, 'B', 'H'),(7, 'C', 'D'),(4, 'C', 'F'),(2, 'C', 'I'),(9, 'D', 'E'),(10, 'D', 'F'),(10, 'E', 'F'),(2, 'G', 'F'),(6, 'G', 'I'),(1, 'G', 'H'),(7, 'H', 'I')])
=#
