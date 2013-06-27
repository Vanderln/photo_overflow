#!/bin/env ruby
# encoding: utf-8

users = <<-USERS
lungegrammer
shotel6
reelpeet
frissata
dankbowl
cpfeist
miltcross
smartchang
realisticyield
codesliced
shotelidayinn
hannamcgee
USERS


emails = <<-EMAILS
lungegrammer@mail.com
shotel6@mail.com
reelpeet@mail.com
frissata@mail.com
dankbowl@mail.com
cpfeist@mail.com
miltcross@mail.com
smartchang@mail.com
realisticyield@mail.com
codesliced@mail.com
shotelidayinn@mail.com
hannamcgee@mail.com
EMAILS


question_titles = <<-QUESTION_TITLES
How do you do this?
Collab this?
I need a caption
How can I make this cooler?
Retouch me
What's the story here?
Should this be in my portfolio?
Do you see what I see?
Real or not real?
How did they light this?
How do I do this with my iPhone?
QUESTION_TITLES

quest_content = <<-QUEST_CONTENT
I'm a copycat at heart.
If I can shoot like this, I'll definitely be on the popular page.
Oh, someone, anyone, help me shoot like this.
QUEST_CONTENT


paths = <<-PATHS
http://farm9.staticflickr.com/8262/8696430729_1bbd744d53_z.jpg
http://farm9.staticflickr.com/8301/7890597804_e96f5995cc_z.jpg
http://farm9.staticflickr.com/8301/7890597804_cca49aa7c0_h.jpg
http://farm9.staticflickr.com/8151/7600336030_5057b7ba62_k.jpg
http://distilleryimage2.ak.instagram.com/085f7cb44f0211e28c8422000a1f931c_7.jpg
http://distilleryimage10.ak.instagram.com/043a2bce40df11e2904b22000a1f8c1d_7.jpg
http://distilleryimage4.ak.instagram.com/f5f085d8411811e2862522000a1f9c96_7.jpg
http://distilleryimage11.ak.instagram.com/77bc664838b511e29f5b22000a1fc2ca_7.jpg
http://distilleryimage2.ak.instagram.com/de327820cfe811e2a84922000a1f8c0f_7.jpg
http://distilleryimage3.ak.instagram.com/da3ad342ac3f11e2882622000a1f985d_7.jpg
http://distilleryimage2.ak.instagram.com/33d3268aad5711e2b95b22000a1fab39_7.jpg
http://distilleryimage8.ak.instagram.com/128891848ad111e2a77722000a1fbc49_7.jpg
http://distilleryimage1.ak.instagram.com/36ee739e880c11e2b5c422000a1f9a53_7.jpg
http://distilleryimage5.ak.instagram.com/390b800c3b5611e28dc722000a1fbcbc_7.jpg
PATHS


acontent = <<-ACONTENT
I've done this before. Let me go find my notes and I'll get back to you later today.
Holy crap. That's amazing. I wanna do that too.
Use a tripod.
Brace your elbows against your waist. That will let you stay steady.
Start with the default settings.
Tell your uncle straight up to not expect much from you. 
A good dish with a BARE BULB head inside of it yields a look and feel that softboxes and umbrellas do not. 
Yep! Still use and still love Photo Mechanic. 
You can't. You have to use a DSLR.
I wanna collab! I live near you. Let's meet up.
I don’t delete all or delete them while plugged into my computer. I just pop it in the camera and hit format. 
ACONTENT

answer_urls = <<-ANSWER_URLS
http://farm9.staticflickr.com/8243/8534635474_d149840cb2_z.jpg
http://distilleryimage6.ak.instagram.com/282682ecb9e511e2ac7c22000a1f96a8_7.jpg
http://distilleryimage0.ak.instagram.com/a33242a27a2d11e2983d22000a9f199e_7.jpg
http://distilleryimage2.ak.instagram.com/a11a85c6723811e2a12822000a9f18f6_7.jpg
http://distilleryimage4.ak.instagram.com/87faa73c4b3311e2806d22000a1f9e4d_7.jpg
ANSWER_URLS


comment_content = <<-COMMENT_CONTENT
Dang!
Lame
Anyone could do that
This is just perfect.
What?
I don't get it.
Love this    
COMMENT_CONTENT

user_seed = users.each_line.to_a
email_seed = emails.each_line.to_a
question_titles_seed = question_titles.each_line.to_a
paths_seed = paths.each_line.to_a
quest_content_seed = quest_content.each_line.to_a
answers_content_seed = acontent.each_line.to_a
answer_urls_seed = answer_urls.each_line.to_a
comment_content_seed = comment_content.each_line.to_a

user_seed.each do |u|
  user = User.create(
    username: u.strip,
    email: email_seed.shift.strip,
    password: "foxinsocks"
    )
end

allusers = ((1..12).to_a).shuffle
question_titles_seed.each do |qt|
  question= Question.create(
    content: quest_content_seed.sample.strip,
    user_id: allusers.pop,
    path: paths_seed.sample.strip,
    title: qt.strip
    )
end

allusers = ((1..12).to_a).shuffle
allqs = ((1..11).to_a).shuffle
11.times do
  answer = Answer.create(
    # path: answer_urls_seed.sample.strip,
    question_id: allqs.pop,
    user_id: allusers.sample,
    content: answers_content_seed.sample.strip
    )
end

someqs = ((1..5).to_a).shuffle
5.times do
  answer = Answer.create(
    question_id: someqs.pop,
    user_id: allusers.sample,
    path: answer_urls_seed.sample.strip,
    content: answers_content_seed.sample.strip
    )
end

allusers = ((1..12).to_a).shuffle
allas = ((1..11).to_a).shuffle
5.times do 
  comment = Comment.create(
     user_id: allusers.sample,
     content: comment_content_seed.sample.strip,
     commentable_type: "Answer",
     commentable_id: allas.pop
    )
end


allusers = ((1..12).to_a).shuffle
allas = ((1..11).to_a).shuffle
8.times do 
  comment = Comment.create(
     user_id: allusers.sample,
     content: comment_content_seed.sample.strip,
     commentable_type: "Question",
     commentable_id: allas.pop
    )
end
