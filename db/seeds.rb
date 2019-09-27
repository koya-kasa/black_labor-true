# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faq.create!(
  [
    {
        faq_kind: '記事の投稿について'
    },
    {
        faq_kind: 'ユーザー登録について'
    },
    {
        faq_kind: 'サイトの使い方'
    },
    {
        faq_kind: 'その他'
    }
  ]
)
