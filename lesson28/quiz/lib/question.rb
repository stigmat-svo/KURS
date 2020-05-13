class Question
  attr_reader :quest, :answer, :points, :time_off, :variants

  def initialize(quest, answer, points, time, variants = [])
    @quest = quest
    @answer = answer
    @points = points
    @time_off = time
    @variants = variants
  end

  def inclination(points, singular, singular_rod, plural_rod)
    modul = points % 10
    modul_2 = points % 100
    if (11..14).cover?(modul_2)
      return plural_rod
    elsif modul == 1
      return singular
    elsif (2..4).cover?(modul)
      return singular_rod
    else
      return plural_rod
    end
  end

  def to_s
    "\n#{@quest} (#{@points} #{inclination(points, "балл", "балла", "баллов")})\n\n"
  end
end





