import Base.show

#=Please include the files needed for the main program using the following commands:
include("projet/phase1/node.jl")
include("projet/phase1/edge.jl")
include("projet/phase1/graph.jl")
include("projet/phase1/read_stsp.jl")=#

#=Reading the nodes in the bayg29.tsp=#
Data_nodes=read_nodes(read_header("instances/stsp/bayg29.tsp"),"instances/stsp/bayg29.tsp")
Data_edges=read_edges(read_header("instances/stsp/bayg29.tsp"),"instances/stsp/bayg29.tsp")

nod=[]

for i in keys(Data_nodes)
    node=Node(string(i),Data_nodes[i])
    push!(nod,node)
end

#=Calling the Array containing the nodes and the Array containing the edges=#
return nod
return Data_edges
