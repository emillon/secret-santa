require 'test_helper'

class DrawMailerTest < ActionMailer::TestCase
  def setup
    @event = events :secretsanta
    @michel = participants :michel
    bob = participants :bob
    @draw = Draw.new(event: @event, giver: @michel, receiver: bob)
  end

  test "gift" do
    mail = DrawMailer.gift @draw
    assert_equal "Secret Santa - gift assignment for Michel", mail.subject
    assert_equal [@michel.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    for part in [mail.html_part.decoded, mail.text_part.decoded]
      assert_match "Hello Michel", part
      assert_match /to.*Bob/m, part
      assert (part != /amount/)
    end
  end

  test "amount is in mail" do
    @event.amount = '5€'
    mail = DrawMailer.gift @draw
    for part in [mail.html_part.decoded, mail.text_part.decoded]
      assert_match /amount.*5€/, part
    end
  end

  test "emails get localized" do
    @event.locale = :fr
    @event.amount = '5€'
    mail = DrawMailer.gift @draw
    assert_equal "Secret Santa - attribution du cadeau pour Michel", mail.subject
    assert_equal [@michel.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    for part in [mail.html_part.decoded, mail.text_part.decoded]
      assert_match "Bonjour Michel", part
      assert_match /à.*Bob/m, part
      assert_match /montant.*5€/, part
    end
  end
end
