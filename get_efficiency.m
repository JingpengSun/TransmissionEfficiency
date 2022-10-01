frame_num = size(framed_data,1); % data length
num_city = length(city_names); % number of cite
global_eff = zeros(frame_num,1)-100; % initial to -100
global_bin_eff = zeros(frame_num,1)-100; % initial to -100
local_eff = zeros(frame_num,num_city)-100; % local efficiency 
local_bin_eff = zeros(frame_num,num_city)-100;

for i = 1:frame_num
    causal_matrix = total_causal{i,1};
    causal_matrix_bin = total_causal_bin{i,1}; 
    global_eff(i) = efficiency_wei(causal_matrix,0);
    local_eff(i,:) = efficiency_wei(causal_matrix,2)'; % parameter 2 represent modified local efficiency,
    
    global_bin_eff(i) = efficiency_bin(causal_matrix_bin,0);
    local_bin_eff(i,:) = efficiency_bin(causal_matrix_bin,1)'; % parameter 1 represent original local efficiency
end
