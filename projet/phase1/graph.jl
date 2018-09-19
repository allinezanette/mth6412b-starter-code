import Base.show

"""Abstract type from which other types of graphs are deriving."""
abstract type AbstractGraph{T} end

"""Type representing a graph as a group of nodes and edges.
Example :

node1 = Node("Joe", 3.14)
node2 = Node("Steve", exp(1))
node3 = Node("Jill", 4.12)
edge1 = Edge([node1,node2], 1)
edge2 = Edge([node2,node3], 2)
G = Graph("Ick", [node1, node2, node3], [edge1, edge2])
Atention, all the nodes have to have data of the same type.

"""
mutable struct Graph{T} <: AbstractGraph{T}
	name::String
	nodes::Vector{Node{T}}
	edges::Vector{Edge{T}}
end

"""Add a node to the graph."""
function add_node!(graph::Graph{T}, node::Node{T}) where T
	push!(graph.nodes, node)
	graph
end

"""Add an edge to the graph."""
function add_edge!(graph::Graph{T}, edge::Edge{T}) where T
	push!(graph.edges, edge)
	graph
end

# we assume that all the graphs coming from AbtractGraph have 'name', 'nodes'
# and 'edges'.

"""return the name of the graph."""
name(graph::AbstractGraph) = graph.name

"""return the list of nodes in the graph."""
nodes(graph::AbstractGraph) = graph.nodes

"""return the number of nodes in the graph."""
nb_nodes(graph::AbstractGraph) = length(graph.nodes)

"""return the list of edges in the graph."""
edges(graph::AbstractGraph) = graph.edges

"""return the number of edges in the graph."""
nb_edges(graph::AbstractGraph) = length(graph.edges)

"""Displaying a graph"""
function show(graph::Graph)
	graph_name = name(graph)
	graph_nb_nodes = nb_nodes(graph)
	graph_nb_edges = nb_edges(graph)
	s = string("Graph ", graph_name, " has ", graph_nb_nodes, " nodes.")
	n = string("Graph ", graph_name, " has ", graph_nb_edges, " edges.")
	for node in nodes(graph)
		s = string(s, "\n", show(node))
	end
	for edge in edges(graph)
		n = string(n, "\n", show(edge))
	end
	println(s)
	println(n)
end
