def distance_3d(point_1, point_2)
  xdiff = point_2[0] - point_1[0]
  ydiff = point_2[1] - point_1[1]
  zdiff = point_2[2] - point_1[2]
  (xdiff**2+ydiff**2+zdiff**2)**0.5
end


junc_boxes = File.read("Day08.txt").split.map{|line| line.split(',').map(&:to_i)}
connections = junc_boxes.map.with_index{|c,i| [c,-1]}.to_h

PAIRS_TO_CONNECT = 1000
distances_ranked = junc_boxes.combination(2).sort_by{|a,b| distance_3d(a,b)}
#p1
free_circuit = 1
steps = 0
loop do 
  steps+=1
  puts connections.reject{|k,v| v==-1}.group_by{|k,v| v}.map{|k,v| v.size}.sort_by{-_1}[..2].inject(:*) if steps == PAIRS_TO_CONNECT
  #find shortest distance pair, that is not matched yet
  node_1,node_2 = distances_ranked.shift
  #puts "Best combo is #{node_1.inspect} and #{node_2.inspect}"
  connect_1 = connections[node_1]
  connect_2 = connections[node_2]
  if connect_1 == -1 && connect_2 == -1
    connections[node_1] = free_circuit
    connections[node_2] = free_circuit
    free_circuit+=1
  elsif connect_1 == -1 || connect_2 == -1
    target_circuit = [connect_1,connect_2].max
    connections[node_1] = target_circuit
    connections[node_2] = target_circuit
  else
    target_circuit = [connect_1,connect_2].min
    linked_circuit = [connect_1,connect_2].max
    connections.each{|k,v| connections[k] = target_circuit if v == linked_circuit}
  end
  if connections.group_by{|k,v| v}.size == 1
    puts node_1[0]*node_2[0]
    exit
  end
end
