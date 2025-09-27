enum FostStatus {
  draft,
  pending,
  confirmed,
  ongoing,
  closing_requested,
  completed,
  declined,
  cancelled,
  unresolved,
  update_pending,
  ongoing_requested
}

enum FostType {
  solo,
  mutual
}

enum FostRole {
  lender,
  borrower,
  other
}

enum FostCategory {
  money,
  electronics,
  books,
  clothing,
  tools,
  kitchen,
  gaming,
  services,
  other
}