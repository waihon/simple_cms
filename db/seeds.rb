# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Generate seed data:
#   rake db:migrate:reset
#   rake db:seed
#
# The create! method is just like the create method, except it raises an exception
# for an invalid user rather than returning false. This behavior makes debugging
# easier by avoiding silent errors.
#
# The suffix of each variable below corresponds to record id per db/simple_cms_development.sql.
admin_user1 = AdminUser.create!(first_name: "Kevin", 
                                last_name: "Skoglund",
                                email: "kevin@nowhere.com",
                                username: "kskoglund",
                                created_at: "2013-08-21 15:59:57",
                                updated_at: "2013-09-15 03:23:56",
                                password: "testpassword")

subject1 = Subject.create!(name: "Initial Subject",
                           position: 1,
                           visible: true,
                           created_at: "2012-08-15 16:48:00",
                           updated_at: "2013-09-07 04:11:38")

subject2 = Subject.create!(name: "Revised Subject",
                           position: 2,
                           visible: true,
                           created_at: "2013-08-15 16:54:07",
                           updated_at: "2013-08-27 16:04:32")

subject4 = Subject.create!(name: "Third Subject",
                           position: 3,
                           visible: false,
                           created_at: "2013-08-15 19:03:56",
                           updated_at: "2013-08-15 19:03:56")

page2 = Page.create!(subject: subject1,
                     name: "First Page",
                     permalink: "first",
                     position: 1,
                     visible: false,
                     created_at: "2013-08-21 15:09:23",
                     updated_at: "2013-08-21 15:09:23")

page3 = Page.create!(subject: subject2,
                     name: "Second Page",
                     permalink: "second",
                     position: 2,
                     visible: false,
                     updated_at: "2013-08-21 15:10:32",
                     created_at: "2013-09-07 03:38:26")

section1 = Section.create!(page: page2,
                           name: "Section One",
                           position: 1,
                           visible: false,
                           content_type: "text",
                           content: "Test content",
                           created_at: "2013-08-21 16:58:26",
                           updated_at: "2013-09-07 03:42:36")

admin_user1.pages << page2

section_edit1 = SectionEdit.create!(editor: admin_user1, 
                                    section: section1, 
                                    summary: "Test edit",
                                    updated_at: "2013-08-21 17:00:38",
                                    created_at: "2013-08-21 17:01:20")

section_edit2 = SectionEdit.create!(editor: admin_user1, 
                                    section: section1, 
                                    summary: "Ch-ch-ch-changes",
                                    updated_at: "2013-08-21 17:03:32",
                                    created_at: "2013-08-21 17:03:32")