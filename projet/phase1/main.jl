file = "instances/stsp/bayg29.tsp"

nodes_init, edges_init = read_stsp(file)

nodes_init = sort(nodes_init)

nodes_graph = Array{Node{Vector{Float64}}, 1}()
edges_graph = Array{Edge{Vector{Float64}}, 1}()

for node in nodes_init
    push!(nodes_graph, Node(string(node[1]), node[2]))
end

nodes_graph = Array{Node{Vector{Float64}}, 1}()
edges_graph = Array{Edge{Vector{Float64}}, 1}()

for node in nodes_init
    push!(nodes_graph, Node(string(node[1]), node[2]))
end

Data_edges=read_edges(read_header(file),file)

k=1
for i=1:length(nodes_graph)
    for j=i+1:length(nodes_graph)
        push!(edges_graph,Edge([nodes_graph[Data_edges[k][1]],nodes_graph[Data_edges[k][2]]],Data_edges[k][3]))
        k=k+1
    end
end
G = Graph("Glaibi&Zanette", nodes_graph, edges_graph)
show(G)
