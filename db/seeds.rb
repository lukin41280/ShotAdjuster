Club.destroy_all
Distance.destroy_all
Golfer.destroy_all

Club.create!({name: "2W"})
a = Club.create!({name: "3W"})
Club.create!({name: "4W"})
b = Club.create!({name: "5W"})
Club.create!({name: "6W"})
Club.create!({name: "7W"})
Club.create!({name: "2H"})
Club.create!({name: "3H"})
c = Club.create!({name: "4H"})
d = Club.create!({name: "5H"})
e = Club.create!({name: "6H"})
Club.create!({name: "2I"})
Club.create!({name: "3I"})
Club.create!({name: "4I"})
Club.create!({name: "5I"})
Club.create!({name: "6I"})
f = Club.create!({name: "7I"})
g = Club.create!({name: "8I"})
h = Club.create!({name: "9I"})
i = Club.create!({name: "PW"})
j = Club.create!({name: "GW"})
k = Club.create!({name: "SW"})
l = Club.create!({name: "AW"})

distance = 50
while distance < 251
  Distance.create!({yards: distance})
  distance += 1
end

jay = Golfer.create!({name: "Jay"})
jay.clubs << [a,b,c,d,e,f,g,h,i,j,k,l]

club_distance_builder(a, 210)
club_distance_builder(b, 200)
club_distance_builder(c, 190)
club_distance_builder(d, 180)
club_distance_builder(e, 170)
club_distance_builder(f, 160)
club_distance_builder(g, 150)
club_distance_builder(h, 140)
club_distance_builder(i, 130)
club_distance_builder(j, 110)
club_distance_builder(k, 80)
club_distance_builder(l, 60)
