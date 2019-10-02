# OOP Image Blur 3 Challenge
# Author: Chris Howle

class Image

    attr_reader :img
    attr_reader :transformed_img
    attr_reader :rows
    attr_reader :columns
  
    def initialize(array)
      @img=array
      @rows=array.count
      @columns=array[0].count
      @transformed_img=Array.new(@rows){Array.new(@columns, 0)}
    end
  
    def output_image(image_out)
        image_out.each do |i|
          i.each do |j|
  
            # Use print instead of puts to avoid the new line after each element
            print j
          end
  
          # After each row, start a new line
          puts "\n"
        end
    end
  
    def blur(dist)
        r=0
        @img.each do |i|
          #puts i
          c=0
          i.each do |j|
            # Use print instead of puts to avoid the new line after each element
            if j == 1
              # First, populate exact spot in transformed image
              @transformed_img[r][c] = 1
              # Use n to track the distance; loop until n is equal to dist
              n=0
              # Next, check conditions and populate adjacent values transformed image if conditions met
              # If not on the left border, set the pixel left of current to 1
              while n < dist
                if c> n
                  @transformed_img[r][c-(n+1)] = 1
                end
                # If not on the right border, set the pixel right of current to 1
                if c+n < @columns - 1
                  @transformed_img[r][c+(n+1)] = 1
                end
                # If not on the upper border, set the pixel above current to 1
                if r > n 
                  @transformed_img[r-(n+1)][c] = 1
                end
                # If not on the bottom border, set the pixel below current to 1
                if r+n < @rows - 1
                  @transformed_img[r+(n+1)][c] = 1
                end
                n += 1
              end # end while
            end # end if j == 1
            if c < @columns-1
                c=c+1
            end
          end #end i.each
        r=r+1
        end #end img.each
    end #end transform_image
  
end #end Class




  