# 大会日程
schedules = [
  { ymd: '2020-07-01', start: '09:00', end: '12:00', place: '朝日 中学校', addcomment: '校庭'},
  { ymd: '2020-07-02', start: '09:00', end: '12:00', place: '柏木 中学校', addcomment: '校庭'},
  { ymd: '2020-07-03', start: '09:00', end: '12:00', place: '桜木 中学校', addcomment: '校庭'},
  { ymd: '2020-07-04', start: '09:00', end: '12:00', place: '高田 中学校', addcomment: '校庭'},
  { ymd: '2020-07-05', start: '09:00', end: '12:00', place: '中野 中学校', addcomment: '校庭'},
]

# 出席者
names       = %w(浅野 加藤 佐々木 田中 中村 濱野 松田 矢野 乱橋 和田)
attendances = %w(sanka tabun mitei kesseki)

# 生成
schedules.each_with_index do |s, index|
  schedule = Schedule.create(s)
  names.each.with_index(0) do |name, index|
    attendance = attendances[index % 4]
    Answer.create(schedule_id: schedule.id, name: name, reason: attendance, comment: 'がんばります')
  end
end
