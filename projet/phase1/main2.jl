import Base.show
using Test
using Plots

#Including the necessary files
include("node.jl")
include("edge.jl")
include("graph.jl")
include("read_stsp.jl")
include("kruskal.jl")

#Reading the file bayg29, please remove the "#" to test for the other instances(bays29)
file = "instances/stsp/bayg29.tsp"
#file = "instances/stsp/bays29.tsp"

#Reading the nodes data and position of the edges from the stsp file
nodes_init, edges_init = read_stsp(file)

#Initializing the list that will contain the name of the nodes
l_nodes=[]
@test length(l_nodes)==0

#Filling up the list l_nodes with the name of the nodes
for i in nodes_init
    push!(l_nodes,string(i[1]))
end
sort!(l_nodes)

#Reading the edges data from the stsp file
Data_edges=read_edges(read_header(file),file)

#Initializing the list that will contain the edges
l_edges=[]
@test length(l_edges)==0

#Filling up the list l_edges with the name of the edges
for k in Data_edges
    push!(l_edges,(trunc(Int64,(k[3])),string(k[1]),string(k[2])))
end
sort!(l_edges)

#Building a graph in the format of a dictionanry as required by the kruskal algorithm
g=Dict("nodes"=>l_nodes,"edges"=>l_edges)

#Calling the kruskal algorithm
show(kruskal!(g))
