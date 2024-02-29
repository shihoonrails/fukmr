module BlogsHelper
    def faculty_background_class(faculty)
        case faculty
        when "自然"
          "bg-green"
        when "カフェ"
          "bg-brown"
        when "ごはん"
          "bg-orange"
        when "温泉"
          "bg-blue"
        else
          "bg-black"  # default color
        end
      end
    
      def rating_background_class(rating)
        case rating
        when "とても良い"
          "bg-1"
        when "良い"
          "bg-2"
        when "普通"
          "bg-3"
        when "あまり..."
          "bg-4"
        else
          "bg-black"  # default color
        end
      end
end
