frame_num = size(framed_data,1); % 数据长度
num_city = length(city_names); % 城市个数
global_eff = zeros(frame_num,1)-100; % 初始化为-100
global_bin_eff = zeros(frame_num,1)-100; % 初始化为-100
local_eff = zeros(frame_num,num_city)-100; % local efficiency 按照图的顶点数输出结果，注意与global efficiency数组大小的区别
local_bin_eff = zeros(frame_num,num_city)-100;

for i = 1:frame_num
    causal_matrix = total_causal{i,1};
    causal_matrix_bin = total_causal_bin{i,1}; 
    global_eff(i) = efficiency_wei(causal_matrix,0);
    local_eff(i,:) = efficiency_wei(causal_matrix,2)'; % 此处的参数2也是local efficiency, 只不过是修改后的local efficiency
    
    global_bin_eff(i) = efficiency_bin(causal_matrix_bin,0);
    local_bin_eff(i,:) = efficiency_bin(causal_matrix_bin,1)'; % 参数1 也是local efficiency
end
