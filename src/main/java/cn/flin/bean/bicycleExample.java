package cn.flin.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class bicycleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public bicycleExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andBicycleidIsNull() {
            addCriterion("bicycleid is null");
            return (Criteria) this;
        }

        public Criteria andBicycleidIsNotNull() {
            addCriterion("bicycleid is not null");
            return (Criteria) this;
        }

        public Criteria andBicycleidEqualTo(Integer value) {
            addCriterion("bicycleid =", value, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidNotEqualTo(Integer value) {
            addCriterion("bicycleid <>", value, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidGreaterThan(Integer value) {
            addCriterion("bicycleid >", value, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidGreaterThanOrEqualTo(Integer value) {
            addCriterion("bicycleid >=", value, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidLessThan(Integer value) {
            addCriterion("bicycleid <", value, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidLessThanOrEqualTo(Integer value) {
            addCriterion("bicycleid <=", value, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidIn(List<Integer> values) {
            addCriterion("bicycleid in", values, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidNotIn(List<Integer> values) {
            addCriterion("bicycleid not in", values, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidBetween(Integer value1, Integer value2) {
            addCriterion("bicycleid between", value1, value2, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBicycleidNotBetween(Integer value1, Integer value2) {
            addCriterion("bicycleid not between", value1, value2, "bicycleid");
            return (Criteria) this;
        }

        public Criteria andBianhaoIsNull() {
            addCriterion("bianhao is null");
            return (Criteria) this;
        }

        public Criteria andBianhaoIsNotNull() {
            addCriterion("bianhao is not null");
            return (Criteria) this;
        }

        public Criteria andBianhaoEqualTo(String value) {
            addCriterion("bianhao =", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoNotEqualTo(String value) {
            addCriterion("bianhao <>", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoGreaterThan(String value) {
            addCriterion("bianhao >", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoGreaterThanOrEqualTo(String value) {
            addCriterion("bianhao >=", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoLessThan(String value) {
            addCriterion("bianhao <", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoLessThanOrEqualTo(String value) {
            addCriterion("bianhao <=", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoLike(String value) {
            addCriterion("bianhao like", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoNotLike(String value) {
            addCriterion("bianhao not like", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoIn(List<String> values) {
            addCriterion("bianhao in", values, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoNotIn(List<String> values) {
            addCriterion("bianhao not in", values, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoBetween(String value1, String value2) {
            addCriterion("bianhao between", value1, value2, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoNotBetween(String value1, String value2) {
            addCriterion("bianhao not between", value1, value2, "bianhao");
            return (Criteria) this;
        }

        public Criteria andPinpaiIsNull() {
            addCriterion("pinpai is null");
            return (Criteria) this;
        }

        public Criteria andPinpaiIsNotNull() {
            addCriterion("pinpai is not null");
            return (Criteria) this;
        }

        public Criteria andPinpaiEqualTo(String value) {
            addCriterion("pinpai =", value, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiNotEqualTo(String value) {
            addCriterion("pinpai <>", value, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiGreaterThan(String value) {
            addCriterion("pinpai >", value, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiGreaterThanOrEqualTo(String value) {
            addCriterion("pinpai >=", value, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiLessThan(String value) {
            addCriterion("pinpai <", value, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiLessThanOrEqualTo(String value) {
            addCriterion("pinpai <=", value, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiLike(String value) {
            addCriterion("pinpai like", value, "pinpai");
            return (Criteria) this;
        }


        public Criteria andPinpaiNotLike(String value) {
            addCriterion("pinpai not like", value, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiIn(List<String> values) {
            addCriterion("pinpai in", values, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiNotIn(List<String> values) {
            addCriterion("pinpai not in", values, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiBetween(String value1, String value2) {
            addCriterion("pinpai between", value1, value2, "pinpai");
            return (Criteria) this;
        }

        public Criteria andPinpaiNotBetween(String value1, String value2) {
            addCriterion("pinpai not between", value1, value2, "pinpai");
            return (Criteria) this;
        }

        public Criteria andCidIsNull() {
            addCriterion("cid is null");
            return (Criteria) this;
        }

        public Criteria andCidIsNotNull() {
            addCriterion("cid is not null");
            return (Criteria) this;
        }

        public Criteria andCidEqualTo(Integer value) {
            addCriterion("cid =", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotEqualTo(Integer value) {
            addCriterion("cid <>", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThan(Integer value) {
            addCriterion("cid >", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThanOrEqualTo(Integer value) {
            addCriterion("cid >=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThan(Integer value) {
            addCriterion("cid <", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThanOrEqualTo(Integer value) {
            addCriterion("cid <=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidIn(List<Integer> values) {
            addCriterion("cid in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotIn(List<Integer> values) {
            addCriterion("cid not in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidBetween(Integer value1, Integer value2) {
            addCriterion("cid between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotBetween(Integer value1, Integer value2) {
            addCriterion("cid not between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiIsNull() {
            addCriterion("tianjiariqi is null");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiIsNotNull() {
            addCriterion("tianjiariqi is not null");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiEqualTo(Date value) {
            addCriterionForJDBCDate("tianjiariqi =", value, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiNotEqualTo(Date value) {
            addCriterionForJDBCDate("tianjiariqi <>", value, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiGreaterThan(Date value) {
            addCriterionForJDBCDate("tianjiariqi >", value, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("tianjiariqi >=", value, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiLessThan(Date value) {
            addCriterionForJDBCDate("tianjiariqi <", value, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("tianjiariqi <=", value, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiIn(List<Date> values) {
            addCriterionForJDBCDate("tianjiariqi in", values, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiNotIn(List<Date> values) {
            addCriterionForJDBCDate("tianjiariqi not in", values, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("tianjiariqi between", value1, value2, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andTianjiariqiNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("tianjiariqi not between", value1, value2, "tianjiariqi");
            return (Criteria) this;
        }

        public Criteria andBeizhuIsNull() {
            addCriterion("beizhu is null");
            return (Criteria) this;
        }

        public Criteria andBeizhuIsNotNull() {
            addCriterion("beizhu is not null");
            return (Criteria) this;
        }

        public Criteria andBeizhuEqualTo(String value) {
            addCriterion("beizhu =", value, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuNotEqualTo(String value) {
            addCriterion("beizhu <>", value, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuGreaterThan(String value) {
            addCriterion("beizhu >", value, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuGreaterThanOrEqualTo(String value) {
            addCriterion("beizhu >=", value, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuLessThan(String value) {
            addCriterion("beizhu <", value, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuLessThanOrEqualTo(String value) {
            addCriterion("beizhu <=", value, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuLike(String value) {
            addCriterion("beizhu like", value, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuNotLike(String value) {
            addCriterion("beizhu not like", value, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuIn(List<String> values) {
            addCriterion("beizhu in", values, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuNotIn(List<String> values) {
            addCriterion("beizhu not in", values, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuBetween(String value1, String value2) {
            addCriterion("beizhu between", value1, value2, "beizhu");
            return (Criteria) this;
        }

        public Criteria andBeizhuNotBetween(String value1, String value2) {
            addCriterion("beizhu not between", value1, value2, "beizhu");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(String value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(String value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(String value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(String value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(String value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(String value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLike(String value) {
            addCriterion("status like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotLike(String value) {
            addCriterion("status not like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<String> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<String> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(String value1, String value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(String value1, String value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}