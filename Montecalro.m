clear;clc;
result=zeros(1,10);
for k=1:1:10
    person_num=round(3*rand(1)+1);
    cnt=0;
    cnt1=0;
    cnt2=0;
    counter1=zeros(1,10);
    counter2=zeros(1,10);
    make_time_array1=zeros(1,20);
    make_time_array2=zeros(1,20);
    wait1_i=1;
    wait2_i=1;
    cnt1_num=1;
    cnt2_num=1;
    for time=1:1:3600
        for i=1:1:20
            make_time1=round((90*(rand(1))+30));
            make_time2=round((90*(rand(1))+30));
            person_num=round(3*rand(1)+1);
            
            if(sum(counter1)==0&&sum(counter2)==0&&sum(counter1)==sum(counter2))%두줄 모두 0명일때
                pri=round(rand(1));
            elseif(sum(counter1)<sum(counter2))%줄이있는데 counter2가 더많을때
                pri=0;
            elseif(sum(counter2)<sum(counter1))%줄이있는데 counter1가 더많을때
                pri=1;
            end
            
            
            if(pri==0)
                if(sum(counter1)<=9) %카운터1로 줄을 먼저설때
                    counter1(1,cnt1_num)=person_num;
                    if cnt1_num ==1
                        make_time_array1(1,cnt1_num)=make_time1 + make_time_array1(1,20);
                    else
                        make_time_array1(1,cnt1_num)=make_time1 + make_time_array1(1,cnt1_num-1);
                    end
                    
                    cnt1_num = cnt1_num+1;
                    
                    
                elseif(sum(counter1)>=10&&sum(counter2)<10||sum(counter1)>sum(counter2)) %카운터1에서 꽉차고 카운터2에도 자리가남았을떄,카운터1이 줄이길어서 카운터 2로 설때
                    counter2(1,cnt2_num)=person_num;
                    if cnt2_num ==1
                        make_time_array2(1,cnt2_num)=make_time2 + make_time_array2(1,20);
                    else
                        make_time_array2(1,cnt2_num)=make_time2 + make_time_array2(1,cnt1_num-1);
                    end
                    cnt2_num = cnt2_num+1;
                    
                end
            elseif(pri==1)
                if(sum(counter2)<=9) %카운터2로 줄을 먼저설때
                    counter2(1, cnt2_num)=person_num;
                    if cnt2_num ==1
                        make_time_array2(1,cnt2_num)=make_time2 + make_time_array2(1,20);
                    else
                        make_time_array2(1,cnt2_num)=make_time2 + make_time_array2(1,cnt2_num-1);
                    end
                    cnt2_num = cnt2_num+1;
                    
                elseif(sum(counter2)>=10&&sum(counter1)<10||sum(counter2)>sum(counter1)) %카운터2에서 꽉차고 카운터1에도 자리가남았을떄,카운터2이 줄이길어서 카운터 1로 설때
                    counter1(1,cnt1_num)=person_num;
                    if cnt1_num ==1
                        make_time_array1(1,cnt1_num)=make_time1 + make_time_array1(1,20);
                    else
                        make_time_array1(1,cnt1_num)=make_time1 + make_time_array1(1,cnt1_num-1);
                    end
                    cnt1_num = cnt1_num+1;
                    
                    
                end
            end
        end
        
        
        if time == make_time_array1(1)
            cnt1=cnt1+counter1(1,1);
            counter1=counter1(1,2:length(counter1));
            make_time_array1=make_time_array1(1,2:length(make_time_array1));
            counter1 = [counter1 0];
            make_time_array1=[make_time_array1 0];
            cnt1_num = cnt1_num - 1;
        end
        
        if time == make_time_array2(1)
            cnt2=cnt2+counter2(1,1);
            counter2=counter2(1,2:length(counter2));
            make_time_array2=make_time_array2(1,2:length(make_time_array2));
            counter2 = [counter2 0];
            make_time_array2=[make_time_array2 0];
            
            cnt2_num = cnt2_num - 1;
        end
        
        
        
    end
    result(1,k)=cnt1+cnt2;
end

hist(result);
figure;
plot(1:10,result)
mode(result)
mean_result=mean(result);
median_result=median(result);
boxplot(result)
var_result=var(result);
std_result=std(result);



