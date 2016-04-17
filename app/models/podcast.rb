#  create_table "podcasts", force: :cascade do |t|
#    t.string   "title"
#    t.text     "description"
#    t.integer  "staff_id"
#    t.string   "audio"
#    t.string   "catergory"
#    t.datetime "created_at",  null: false
#    t.datetime "updated_at",  null: false
#  end
#
#  add_index "podcasts", ["catergory", "created_at"], name: "index_podcasts_on_catergory_and_created_at", using: :btree
#  add_index "podcasts", ["created_at"], name: "index_podcasts_on_created_at", using: :btree
#  add_index "podcasts", ["staff_id", "created_at"], name: "index_podcasts_on_staff_id_and_created_at", using: :btree
#  add_index "podcasts", ["staff_id"], name: "index_podcasts_on_staff_id", using: :btree

class Podcast < ActiveRecord::Base
  belongs_to :staff
  belongs_to :show
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, :reject_if => lambda { |a| a[:picture].blank? }, :allow_destroy => true
  
  default_scope -> { order(created_at: :desc) }
  mount_uploader :audio, AudioUploader
  
  validates :catergory,  inclusion: { in: %w(other)}, allow_blank: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :staff_id, presence: true
  validates :show_id, presence: true
  validates :audio, presence: true
  validates_presence_of :image

end
