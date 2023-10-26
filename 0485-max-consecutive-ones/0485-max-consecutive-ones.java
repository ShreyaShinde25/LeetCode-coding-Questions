class Solution {
    public int findMaxConsecutiveOnes(int[] nums) {
       int count=0;
        int max_count=0;
        for(int i=0; i<nums.length; i++){
            if (nums[i]==1)
            {
                count++;
            }
            
            else{
              if(count>max_count){
                  max_count=count;
              }
              count=0;
              continue;
            }

        }
        if(count>max_count){
            max_count=count;
        }
        return max_count; 
    }
}
